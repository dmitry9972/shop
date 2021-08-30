from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view
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


@api_view(['GET'])
def products(request):
    if request.method == 'GET':
        products = Product.objects.all()[:10]
        serializer = ProductSerializer(products, many=True)
        return Response(serializer.data)


class ProductsDetailView(RetrieveAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductDetailSerializer


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

class Discount_brandCreateView(CreateAPIView):
    serializer_class = Discount_brandDetailSerializer

