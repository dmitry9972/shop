from rest_framework import status
from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view, permission_classes, authentication_classes
from main.models import Product, Brand, \
    Country, Photo, Category, \
    Order, Productset, Discount, Discount_pediod, Discount_brand
from rest_framework.generics import RetrieveAPIView, CreateAPIView, ListAPIView, UpdateAPIView
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
from rest_framework.views import APIView



class registration_view(APIView):
    def post(self, request):
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





# @api_view(['POST'])
# def registration_view(request):
#     if request.method == 'POST':
#         serializer = RegistrationSerializer(data=request.data)
#         data={}
#         if serializer.is_valid():
#             account = serializer.save()
#             data['response']= "succesfully registered a new user"
#             data['email'] = account.email
#             data['username'] = account.username
#             token = Token.objects.get(user=account).key
#             data['token']=token
#         else:
#             data = serializer.errors
#         return Response(data)



# @api_view(['GET'])
# def products(request):
#     if request.method == 'GET':
#         products = Product.objects.all()[:10]
#         serializer = ProductSerializer(products, many=True)
#         return Response(serializer.data)


class products(ListAPIView):
    serializer_class = ProductSerializer
    queryset = Product.objects.all()[:10]


class ProductsDetailView(RetrieveAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductDetailSerializer

@permission_classes((IsAuthenticated,))
@authentication_classes([TokenAuthentication, IsAdminUser ])
class ProductsCreateView(CreateAPIView):
    serializer_class = ProductDetailSerializer



class brands(ListAPIView):
    serializer_class = BrandSerializer
    queryset = Brand.objects.all()[:10]



class BrandsDetailView(RetrieveAPIView):
    queryset = Brand.objects.all()
    serializer_class = BrandDetailSerializer


@permission_classes((IsAuthenticated, IsAdminUser))
@authentication_classes([TokenAuthentication,  ])
class BrandsCreateView(CreateAPIView):
    serializer_class = BrandDetailSerializer



class country(ListAPIView):
    serializer_class = CountrySerializer
    queryset = Country.objects.all()[:10]


class CountryDetailView(RetrieveAPIView):
    queryset = Country.objects.all()
    serializer_class = CountryDetailSerializer

@permission_classes((IsAuthenticated, IsAdminUser))
@authentication_classes([TokenAuthentication,  ])
class CountryCreateView(CreateAPIView):
    serializer_class = CountryDetailSerializer




class photo(ListAPIView):
    serializer_class = PhotoSerializer
    queryset = Photo.objects.all()[:10]



class PhotoDetailView(RetrieveAPIView):
    queryset = Photo.objects.all()
    serializer_class = PhotoDetailSerializer

@permission_classes((IsAuthenticated, IsAdminUser))
@authentication_classes([TokenAuthentication,  ])
class PhotoCreateView(CreateAPIView):
    serializer_class = PhotoDetailSerializer




class category(ListAPIView):
    serializer_class = CategorySerializer
    queryset = Category.objects.all()[:10]




class CategoryDetailView(RetrieveAPIView):
    queryset = Category.objects.all()
    serializer_class = CategoryDetailSerializer

@permission_classes((IsAuthenticated, IsAdminUser))
@authentication_classes([TokenAuthentication,  ])
class CategoryCreateView(CreateAPIView):
    serializer_class = CategoryDetailSerializer



class order(ListAPIView):
    serializer_class = OrderSerializer
    queryset = Order.objects.all()[:10]



class OrderDetailView(RetrieveAPIView):
    queryset = Order.objects.all()
    serializer_class = OrderDetailSerializer

@permission_classes((IsAuthenticated,))
@authentication_classes([TokenAuthentication, ])
class OrderCreateView(CreateAPIView):
    serializer_class = OrderDetailSerializer


@permission_classes((IsAuthenticated,))
@authentication_classes([TokenAuthentication, ])
class OrderUpdateView(UpdateAPIView):
    queryset = Order.objects.all()
    lookup_field = 'pk'
    serializer_class = OrderDetailSerializer


class productset(ListAPIView):
    serializer_class = ProductsetSerializer
    queryset = Productset.objects.all()[:10]



class ProductsetDetailView(RetrieveAPIView):
    queryset = Productset.objects.all()
    serializer_class = ProductsetDetailSerializer


@permission_classes((IsAuthenticated,))
@authentication_classes([TokenAuthentication, ])
class ProductsetCreateView(CreateAPIView):
    serializer_class = ProductsetDetailSerializer



class discount(ListAPIView):
    serializer_class = DiscountSerializer
    queryset = Discount.objects.all()[:10]


class DiscountDetailView(RetrieveAPIView):
    queryset = Discount.objects.all()
    serializer_class = DiscountDetailSerializer


@permission_classes((IsAuthenticated, IsAdminUser))
@authentication_classes([TokenAuthentication,  ])
class DiscountCreateView(CreateAPIView):
    serializer_class = DiscountDetailSerializer




class discount_pediod(ListAPIView):
    serializer_class = Discount_pediodSerializer
    queryset = Discount_pediod.objects.all()[:10]


class Discount_pediodDetailView(RetrieveAPIView):
    queryset = Discount_pediod.objects.all()
    serializer_class = Discount_pediodDetailSerializer


@permission_classes((IsAuthenticated, IsAdminUser))
@authentication_classes([TokenAuthentication,  ])
class Discount_pediodCreateView(CreateAPIView):
    serializer_class = Discount_pediodDetailSerializer



class discount_brand(ListAPIView):
    serializer_class = Discount_brandSerializer
    queryset = Discount_brand.objects.all()[:10]



class Discount_brandDetailView(RetrieveAPIView):
    queryset = Discount_brand.objects.all()
    serializer_class = Discount_brandDetailSerializer

@permission_classes((IsAuthenticated, IsAdminUser))
@authentication_classes([TokenAuthentication,  ])
class Discount_brandCreateView(CreateAPIView):
    serializer_class = Discount_brandDetailSerializer

