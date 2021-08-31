from rest_framework import status
from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view, permission_classes, authentication_classes
from main.models import Product, Brand, \
    Country, Photo, Category, \
    Order, Productset, Discount, Discount_pediod, Discount_brand
from rest_framework.generics import RetrieveAPIView, CreateAPIView
from .serializers import ProductSerializer, ProductDetailSerializer
from .serializers import BrandSerializer, BrandDetailSerializer, \
    CountrySerializer, CountryDetailSerializer, \
    PhotoSerializer, PhotoDetailSerializer, \
    CategorySerializer, CategoryDetailSerializer, \
    OrderSerializer, OrderDetailSerializer, \
    ProductsetSerializer, ProductsetDetailSerializer, \
    DiscountSerializer, DiscountDetailSerializer, \
    Discount_pediodSerializer, Discount_pediodDetailSerializer, \
    Discount_brandSerializer, Discount_brandDetailSerializer
from .serializers import RegistrationSerializer
from rest_framework.authtoken.models import Token
from rest_framework.permissions import IsAuthenticated, IsAdminUser
from rest_framework.authentication import TokenAuthentication



@api_view(['POST'])
def registration_view(request):
    if request.method == 'POST':
        serializer = RegistrationSerializer(data=request.data)
        data={}
        if serializer.is_valid():
            account = serializer.save()
            data['response']= "succesfully registered a new user"
            data['email'] = account.email
            data['username'] = account.username
            token = Token.objects.get(user=account).key
            data['token']=token
        else:
            data = serializer.errors
        return Response(data)


@api_view(['GET'])
def products(request):
    if request.method == 'GET':
        products = Product.objects.all()[:10]
        serializer = ProductSerializer(products, many=True)
        return Response(serializer.data)


class ProductsDetailView(RetrieveAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductDetailSerializer

@permission_classes((IsAuthenticated,))
@authentication_classes([TokenAuthentication, IsAdminUser ])
class ProductsCreateView(CreateAPIView):
    serializer_class = ProductDetailSerializer


@api_view(['GET'])
def brands(request):
    if request.method == 'GET':
        brands = Brand.objects.all()[:10]
        serializer = BrandSerializer(brands, many=True)
        return Response(serializer.data)


class BrandsDetailView(RetrieveAPIView):
    queryset = Brand.objects.all()
    serializer_class = BrandDetailSerializer


@permission_classes((IsAuthenticated, IsAdminUser))
@authentication_classes([TokenAuthentication,  ])
class BrandsCreateView(CreateAPIView):
    serializer_class = BrandDetailSerializer


@api_view(['GET'])
def country(request):
    if request.method == 'GET':
        country = Country.objects.all()[:10]
        serializer = CountrySerializer(country, many=True)
        return Response(serializer.data)


class CountryDetailView(RetrieveAPIView):
    queryset = Country.objects.all()
    serializer_class = CountryDetailSerializer

@permission_classes((IsAuthenticated, IsAdminUser))
@authentication_classes([TokenAuthentication,  ])
class CountryCreateView(CreateAPIView):
    serializer_class = CountryDetailSerializer


@api_view(['GET'])
def photo(request):
    if request.method == 'GET':
        photo = Photo.objects.all()[:10]
        serializer = PhotoSerializer(photo, many=True)
        return Response(serializer.data)


class PhotoDetailView(RetrieveAPIView):
    queryset = Photo.objects.all()
    serializer_class = PhotoDetailSerializer

@permission_classes((IsAuthenticated, IsAdminUser))
@authentication_classes([TokenAuthentication,  ])
class PhotoCreateView(CreateAPIView):
    serializer_class = PhotoDetailSerializer


@api_view(['GET'])
def category(request):
    if request.method == 'GET':
        category = Category.objects.all()[:10]
        serializer = CategorySerializer(category, many=True)
        return Response(serializer.data)


class CategoryDetailView(RetrieveAPIView):
    queryset = Category.objects.all()
    serializer_class = CategoryDetailSerializer

@permission_classes((IsAuthenticated, IsAdminUser))
@authentication_classes([TokenAuthentication,  ])
class CategoryCreateView(CreateAPIView):
    serializer_class = CategoryDetailSerializer


@api_view(['GET'])
def order(request):
    if request.method == 'GET':
        order = Order.objects.all()[:10]
        serializer = OrderSerializer(order, many=True)
        return Response(serializer.data)


class OrderDetailView(RetrieveAPIView):
    queryset = Order.objects.all()
    serializer_class = OrderDetailSerializer

@permission_classes((IsAuthenticated,))
@authentication_classes([TokenAuthentication, ])
class OrderCreateView(CreateAPIView):
    serializer_class = OrderDetailSerializer



@api_view(['GET'])
def productset(request):
    if request.method == 'GET':
        productset = Productset.objects.all()[:10]
        serializer = ProductsetSerializer(productset, many=True)
        return Response(serializer.data)


class ProductsetDetailView(RetrieveAPIView):
    queryset = Productset.objects.all()
    serializer_class = ProductsetDetailSerializer


@permission_classes((IsAuthenticated,))
@authentication_classes([TokenAuthentication, ])
class ProductsetCreateView(CreateAPIView):
    serializer_class = ProductsetDetailSerializer


@api_view(['GET'])
def discount(request):
    if request.method == 'GET':
        discount = Discount.objects.all()[:10]
        serializer = DiscountSerializer(discount, many=True)
        return Response(serializer.data)


class DiscountDetailView(RetrieveAPIView):
    queryset = Discount.objects.all()
    serializer_class = DiscountDetailSerializer


@permission_classes((IsAuthenticated, IsAdminUser))
@authentication_classes([TokenAuthentication,  ])
class DiscountCreateView(CreateAPIView):
    serializer_class = DiscountDetailSerializer


@api_view(['GET'])
def discount_pediod(request):
    if request.method == 'GET':
        discount_pediod = Discount_pediod.objects.all()[:10]
        serializer = Discount_pediodSerializer(discount_pediod, many=True)
        return Response(serializer.data)


class Discount_pediodDetailView(RetrieveAPIView):
    queryset = Discount_pediod.objects.all()
    serializer_class = Discount_pediodDetailSerializer


@permission_classes((IsAuthenticated, IsAdminUser))
@authentication_classes([TokenAuthentication,  ])
class Discount_pediodCreateView(CreateAPIView):
    serializer_class = Discount_pediodDetailSerializer

@api_view(['GET'])
def discount_brand(request):
    if request.method == 'GET':
        discount_brand = Discount_brand.objects.all()[:10]
        serializer = Discount_brandSerializer(discount_brand, many=True)
        return Response(serializer.data)


class Discount_brandDetailView(RetrieveAPIView):
    queryset = Discount_brand.objects.all()
    serializer_class = Discount_brandDetailSerializer

@permission_classes((IsAuthenticated, IsAdminUser))
@authentication_classes([TokenAuthentication,  ])
class Discount_brandCreateView(CreateAPIView):
    serializer_class = Discount_brandDetailSerializer

