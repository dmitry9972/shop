from django.db import models
from django.contrib.auth.models import AbstractUser
from phonenumber_field.modelfields import PhoneNumberField
from datetime import datetime
from django.utils.html import mark_safe
from django.conf import settings
from django.db.models.signals import post_save, m2m_changed
from django.dispatch import receiver
from rest_framework.authtoken.models import Token
from tasks import add, transfer_to_warehouse

class AdvUser(AbstractUser):
    is_activated = models.BooleanField(default=True, db_index=True,
                                       verbose_name='Прошел активацию?')

    phone = PhoneNumberField(null=False, blank=False,
                             verbose_name='Телефон')

    address = models.CharField(max_length=1000, db_index=True, unique=False,
                               verbose_name='Адрес')

    class Meta(AbstractUser.Meta):
        verbose_name_plural = 'Пользователи'
        verbose_name = 'Пользователь'



class Product(models.Model):
    name = models.CharField(default='' , max_length=100, db_index=True, unique=True,
                            verbose_name='Наименование')

    description = models.CharField(max_length=10000, db_index=True, unique=False,
                                   verbose_name='Описание')

    category = models.ForeignKey('Category',
                                 on_delete=models.PROTECT, null=False, blank=False,
                                 verbose_name='Категория')

    brand = models.ForeignKey('Brand',
                              on_delete=models.PROTECT, null=False, blank=False,
                              verbose_name='Брэнд')

    country = models.ForeignKey('Country',
                                on_delete=models.PROTECT, null=False, blank=False,
                                verbose_name='Страна')


    price = models.FloatField(null=False, blank=False, default=0,
                              verbose_name='Цена')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = 'Продукты'
        verbose_name = 'Продукт'
        ordering = ['-price']


class Brand(models.Model):
    name = models.CharField(max_length=1000, db_index=True, unique=False,
                            verbose_name='Название брэнда')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = 'Брэнды'
        verbose_name = 'Брэнд'
        ordering = ['name']


class Country(models.Model):
    name = models.CharField(max_length=100, db_index=True, unique=False,
                            verbose_name='Страна производитель')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = 'Страны'
        verbose_name = 'Страна производитель'
        ordering = ['name']







class Photo(models.Model):
    image = models.ImageField(null=True, blank=True,)
    product = models.ForeignKey('Product', on_delete=models.PROTECT,
                           related_name="images", default=1)

    def image_tag(self):
        return mark_safe('<img src="/%s" width="150" height="150" />'
                         % (self.image))




    image_tag.short_description = 'Image'


    class Meta:
        verbose_name_plural = 'Фотки'
        verbose_name = 'Фото'









class Category(models.Model):
    name = models.CharField(max_length=100, db_index=True, unique=True,
                            verbose_name='Категории')

    sub_level = models.IntegerField(default=0, verbose_name='Уровень вложенности')

    super_category = models.ForeignKey('Category',
                                       on_delete=models.PROTECT, null=True, blank=True,
                                       verbose_name='Старшая категория')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = 'Категории'
        verbose_name = 'Категория'
        ordering = ['name']


class Order(models.Model):
    advuser = models.ForeignKey('AdvUser',
                                on_delete=models.PROTECT, null=False, blank=False,
                                verbose_name='Пользователь')

    productset = models.ManyToManyField('Productset')

    order_date = models.DateTimeField(default=datetime.now)

    PROCESSING_ORDER = 1
    SHIPPED = 2
    DELIVERED = 3
    STATUS_CHOICES = (
        (PROCESSING_ORDER, ('We got your order!')),
        (SHIPPED, ('We have packaged your items and have handed your package to our trusted carriers. ')),
        (DELIVERED, ('Delivered')),
    )


    status = models.PositiveSmallIntegerField( choices=STATUS_CHOICES,  default=PROCESSING_ORDER,
                            verbose_name='Статус')

    def __str__(self):
        return 'Номер заказа: %s' % (self.id)

    class Meta:
        verbose_name_plural = 'Заказы'
        verbose_name = 'Заказ'
        ordering = ['order_date']


class Productset(models.Model):
    advuser = models.ForeignKey('AdvUser',
                                on_delete=models.PROTECT, null=False, blank=False,
                                verbose_name='Пользователь')

    product = models.ForeignKey('Product',
                                on_delete=models.PROTECT, null=False, blank=False,
                                verbose_name='Продукт')

    product_count = models.IntegerField(default=1, verbose_name='Количество')

    class Meta:
        verbose_name_plural = 'Наборы продуктов'
        verbose_name = 'Набор'


class Discount(models.Model):
    product = models.ForeignKey('Product',
                                on_delete=models.PROTECT, null=False, blank=False,
                                verbose_name='Продукт')

    amount = models.FloatField(null=False, blank=False, default=0,
                               verbose_name='Размер скидки')

    def __str__(self):
        return 'Скидка на %s : %s' % (self.product.name, self.amount)

    class Meta:
        verbose_name_plural = 'Скидки на продукт'
        verbose_name = 'Скидка на продукт'
        ordering = ['amount']


class Discount_pediod(models.Model):
    product = models.ForeignKey('Product',
                                on_delete=models.PROTECT, null=False, blank=False,
                                verbose_name='Продукт')

    amount = models.FloatField(null=False, blank=False, default=0,
                               verbose_name='Размер скидки')

    start = models.DateTimeField(default=datetime.now)

    end = models.DateTimeField(default=datetime.now)

    def __str__(self):
        return 'Скидка на %s : %s' % (self.product.name, self.amount)

    class Meta:
        verbose_name_plural = 'Скидки на продукт по сезону'
        verbose_name = 'Скидка на продукт по сезону'
        ordering = ['start']


class Discount_brand(models.Model):
    amount = models.FloatField(null=False, blank=False, default=0,
                               verbose_name='Размер скидки')

    brand = models.ForeignKey('Brand',
                              on_delete=models.PROTECT, null=False, blank=False,
                              verbose_name='Брэнд')

    def __str__(self):
        return 'Скидка на %s : %s' % (self.brand.name, self.amount)

    class Meta:
        verbose_name_plural = 'Скидки на продукт по брэнду'
        verbose_name = 'Скидка на продукт по брэнду'
        ordering = ['brand']

@receiver(post_save, sender = settings.AUTH_USER_MODEL)
def create_auth_token(sender, instance=None, created=False, **kwargs):
    if created:
        Token.objects.create(user=instance)


@receiver(m2m_changed, sender = Order.productset.through)
def push_order_to_celery(sender, instance, action, **kwargs):
    order = instance
    if action == "post_add":
        transfer_data = {}
        transfer_data['order_client'] = order.advuser.username
        transfer_data['order_pk'] = order.pk
        transfer_data['order_date'] = order.order_date
        transfer_data['order_productsets'] = {}

        for m in order.productset.all():
            x = m.pk
            transfer_data['order_productsets'][x] = {}
            transfer_data['order_productsets'][x]['username'] = m.advuser.username
            transfer_data['order_productsets'][x]['product_name'] = m.product.name
            transfer_data['order_productsets'][x]['product_count'] = m.product_count
        print(transfer_data)

        transfer_to_warehouse.delay(transfer_data)


# @receiver(post_save, sender = Order)
# def push_order_to_celery(sender, instance=None, created=True, **kwargs):
#     if created:
#         print('hohohoho!!!')
#         order = instance
#         print(order.pk)
#         print(order.order_date)
#         print(order.productset)
#         print(order.productset.all())
#
#         for m in order.productset.all():
#             print('*')
#             print(m.pk)
#
#         for m in Productset.objects.all():
#             print('////')
#             print(m.pk)
#             print(m.order_set.all())
#
#         print('&&&&&&&&&')
#         x = Productset.objects.filter(order__pk=order.pk)
#         print(x)
#         print('&&&&&&&&&')
#
#         test = Order.objects.get(pk=(order.pk-1))
#         print(test.pk)
#         print(test.order_date)
#         print(test.productset)
#         print(test.productset.all())
#
#         print('&&&&&&&&&')
#         x = Productset.objects.filter(order__pk=(order.pk-1))
#         print(x)
#         print('&&&&&&&&&')
#
#         add.delay(4, 4)
