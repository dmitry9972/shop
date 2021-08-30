from django.contrib import admin
from .models import AdvUser, Product, Brand, \
    Country, Photo, Category, \
    Order, Productset, Discount, Discount_pediod, Discount_brand

from django.utils.html import mark_safe


class AdvUserAdmin(admin.ModelAdmin):
    list_display = ('__str__', 'is_activated', 'date_joined')
    search_fields = ('username', 'email', 'first_name', 'last_name')
    fields = (('username', 'email'), ('first_name', 'last_name'),
              ( 'is_active', 'is_activated'),
              ('is_staff', 'is_superuser'),
              'groups', 'user_permissions',
              ('last_login', 'date_joined'))

    readonly_fields = ('last_login', 'date_joined')


admin.site.register(AdvUser, AdvUserAdmin)

admin.site.register(Brand)
admin.site.register(Country)


class PhotoAdmin(admin.ModelAdmin):
    fields = ['image_tag', 'image']
    readonly_fields = ['image_tag']

admin.site.register(Photo,PhotoAdmin)
admin.site.register(Category)
admin.site.register(Order)
admin.site.register(Productset)
admin.site.register(Discount)
admin.site.register(Discount_pediod)
admin.site.register(Discount_brand)


class PhotoInline(admin.TabularInline):
    model = Photo
    fields = ['image_tag', 'image']
    readonly_fields = ['image_tag']


    def image_tag(self, obj):
        return mark_safe('<img src="/%s" width="150" height="150" />'
                         % (obj.image))

class ProductAdmin(admin.ModelAdmin):



    inlines = [
        PhotoInline
    ]


admin.site.register(Product,ProductAdmin)
