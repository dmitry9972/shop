from django.test import TestCase
from django.urls import reverse
from rest_framework.test import APIClient
from rest_framework.test import APITestCase
from rest_framework import status
from main.models import AdvUser, Product, Brand, \
    Country, Photo, Category, \
    Order, Productset, Discount, Discount_pediod, Discount_brand
from rest_framework.authtoken.models import Token
import tasks
from django.db.models import Max
import json
import datetime
from unittest.mock import patch, Mock
from unittest.mock import MagicMock
import requests

from unittest.mock import patch, Mock
from unittest.mock import MagicMock
import requests




class ApiTestCase(APITestCase):
    def setUp(self) -> None:
        self.client = APIClient()

        self.user = AdvUser.objects.create(username='kitty', password='dogedogedoge', email='cat@cats.ru', )
        self.user.is_staff = True
        self.user.set_password('dogedogedoge')
        self.user.save()

        self.category_one = Category.objects.create(name='Pet food')

        self.brand_one = Brand.objects.create(name='Chappy')

        self.country_one = Country.objects.create(name='England')

        self.product_one = Product.objects.create(name='chappy', description='chappy 500g',
                                                  category=self.category_one, brand=self.brand_one,
                                                  country=self.country_one, price=777)

    @property
    def token(self):
        url = reverse('login')

        data = {
            'username': 'kitty',
            'password': 'dogedogedoge',
        }

        response = self.client.post(url, data, format='json')

        token = response.json().get('token')
        return token

    def test_account(self):
        url = reverse('register')
        data = {
            'email': 'cat@cats.ru',
            'username': 'catzilla',
            'password': '777777777',
            'password2': '777777777',
        }
        response = self.client.post(url, data, format='json')

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(AdvUser.objects.count(), 2)

        url = reverse('login')

        data = {
            'username': 'catzilla',
            'password': '777777777',
        }
        response = self.client.post(url, data, format='json')

        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_product(self):
        url = reverse('product-list')

        response = self.client.get(url, HTTP_AUTHORIZATION='token {}'.format(self.token))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

        data = {
            "name": "Chappy2",
            "description": "Chappy2",
            "price": 1000.0,
            "category": self.category_one.pk,
            "brand": self.brand_one.pk,
            "country": self.country_one.pk
        }

        response = self.client.post(url, data, format='json', HTTP_AUTHORIZATION='token {}'.format(self.token))

        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Product.objects.count(), 2)

        response = self.client.get(url, HTTP_AUTHORIZATION='token {}'.format(self.token))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_brand(self):
        url = reverse('brand-list')

        response = self.client.get(url, HTTP_AUTHORIZATION='token {}'.format(self.token))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

        data = {
            "name": "FA",
        }

        response = self.client.post(url, data, format='json', HTTP_AUTHORIZATION='token {}'.format(self.token))

        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Brand.objects.count(), 2)

        response = self.client.get(url, HTTP_AUTHORIZATION='token {}'.format(self.token))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_country(self):
        url = reverse('country-list')

        response = self.client.get(url, HTTP_AUTHORIZATION='token {}'.format(self.token))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

        data = {
            "name": "Ireland",
        }

        response = self.client.post(url, data, format='json', HTTP_AUTHORIZATION='token {}'.format(self.token))

        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Country.objects.count(), 2)

        response = self.client.get(url, HTTP_AUTHORIZATION='token {}'.format(self.token))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_category(self):
        url = reverse('category-list')

        response = self.client.get(url, HTTP_AUTHORIZATION='token {}'.format(self.token))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

        data = {
            "name": "Ireland",
        }

        response = self.client.post(url, data, format='json', HTTP_AUTHORIZATION='token {}'.format(self.token))

        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Category.objects.count(), 2)

        response = self.client.get(url, HTTP_AUTHORIZATION='token {}'.format(self.token))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_order(self):
        url = reverse('order-list')

        response = self.client.get(url, HTTP_AUTHORIZATION='token {}'.format(self.token))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

        url = reverse('productset-list')

        data = {
            "advuser": self.user.pk,
            "product": self.product_one.pk,
            "product_count": 500,
        }

        response = self.client.post(url, data, format='json', HTTP_AUTHORIZATION='token {}'.format(self.token))

        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

        url = reverse('order-list')
        data = {
            "advuser": self.user.pk,
            "productset": {response.json().get('id'), },
        }

        response = self.client.post(url, data, format='json', HTTP_AUTHORIZATION='token {}'.format(self.token))

        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Category.objects.count(), 1)

        response = self.client.get(url, HTTP_AUTHORIZATION='token {}'.format(self.token))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_prepare_data_for_warehouse(self):
        self.test_order()
        orders = Order.objects.all()
        max = orders.aggregate(Max('pk'))


        correct_dict = {'order_client': 'kitty', 'order_pk': 2,
                        'order_date': '0',
        'order_productsets': {2: {'username': 'kitty', 'product_name': 'chappy', 'product_count': 500}}}

        correct_json = json.dumps(correct_dict)

        result_dict = tasks.prepare_data_for_warehouse(max['pk__max'])
        result_dict['order_date'] = '0'


        result_json = json.dumps(result_dict)
        self.assertEqual( correct_json, result_json)
<<<<<<< HEAD
>>>>>>> 2e6c94e... 45% test done
=======


    def test_transfer_to_warehouse(self):
        self.test_order()
        orders = Order.objects.all()
        max = orders.aggregate(Max('pk'))
        result_dict = tasks.prepare_data_for_warehouse(max['pk__max'])
        requests.post = MagicMock()
        tasks.transfer_to_warehouse(result_dict, max['pk__max'])
        self.assertEqual(requests.post.called, True)



>>>>>>> c93912b... made all tests for shop
