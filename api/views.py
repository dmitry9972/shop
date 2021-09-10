from rest_framework import status
from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view, permission_classes, authentication_classes
from main.models import Product, Brand, \
    Country, Photo, Category, \
    Order, Productset, Discount, Discount_pediod, Discount_brand
from rest_framework.generics import RetrieveAPIView, CreateAPIView, ListAPIView, UpdateAPIView

from .serializers import BrandSerializer, ProductSerializer, CountrySerializer, PhotoSerializer, \
    CategorySerializer, OrderSerializer, ProductsetSerializer, DiscountSerializer, \
    Discount_pediodSerializer, Discount_brandSerializer
from .serializers import RegistrationSerializer
from rest_framework.authtoken.models import Token
from rest_framework.permissions import IsAuthenticated, IsAdminUser, AllowAny
from rest_framework.authentication import TokenAuthentication
from rest_framework.views import APIView
from rest_framework import viewsets
from .permissions import UserPermission, CustomerPermission


class ShopViewSet(viewsets.ModelViewSet):
    permission_classes = (UserPermission,)


class registration_view(APIView):
    def post(self, request):
        serializer = RegistrationSerializer(data=request.data)
        data = {}
        if serializer.is_valid():
            account = serializer.save()
            data['response'] = "successfully registered a new user"
            data['email'] = account.email
            data['username'] = account.username
            token = Token.objects.get(user=account).key
            data['token'] = token
        else:
            data = serializer.errors
        return Response(data)


class ProductsViewSet(ShopViewSet):
    serializer_class = ProductSerializer
    queryset = Product.objects.all()


class BrandsViewSet(ShopViewSet):
    serializer_class = BrandSerializer
    queryset = Brand.objects.all()


class CountryViewSet(ShopViewSet):
    serializer_class = CountrySerializer
    queryset = Country.objects.all()


class PhotoViewSet(ShopViewSet):
    serializer_class = PhotoSerializer
    queryset = Photo.objects.all()


class CategoryViewSet(ShopViewSet):
    serializer_class = CategorySerializer
    queryset = Category.objects.all()


class OrderViewSet(ShopViewSet):
    permission_classes = (CustomerPermission,)
    serializer_class = OrderSerializer
    queryset = Order.objects.all()


class ProductsetViewSet(ShopViewSet):
    permission_classes = (CustomerPermission,)
    serializer_class = ProductsetSerializer
    queryset = Productset.objects.all()


class DiscountViewSet(ShopViewSet):
    serializer_class = DiscountSerializer
    queryset = Discount.objects.all()


class Discount_pediodViewSet(ShopViewSet):
    serializer_class = Discount_pediodSerializer
    queryset = Discount_pediod.objects.all()


class Discount_brandViewSet(ShopViewSet):
    serializer_class = Discount_brandSerializer
    queryset = Discount_brand.objects.all()
