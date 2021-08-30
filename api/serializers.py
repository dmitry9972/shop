from rest_framework import serializers
from main.models import Product, Brand, \
    Country, Photo, Category, \
    Order, Productset, Discount, Discount_pediod, Discount_brand


class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = ('__all__')



class ProductDetailSerializer(serializers.ModelSerializer) :
    class Meta:
        model = Product
        fields = ('__all__')


class BrandSerializer(serializers.ModelSerializer):
    class Meta:
        model = Brand
        fields = ('__all__')


class BrandDetailSerializer(serializers.ModelSerializer) :
    class Meta:
        model = Brand
        fields = ('__all__')


class CountrySerializer(serializers.ModelSerializer):
    class Meta:
        model = Country
        fields = ('__all__')


class CountryDetailSerializer(serializers.ModelSerializer) :
    class Meta:
        model = Country
        fields = ('__all__')

class PhotoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Photo
        fields = ('__all__')


class PhotoDetailSerializer(serializers.ModelSerializer) :
    class Meta:
        model = Photo
        fields = ('__all__')



class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ('__all__')


class CategoryDetailSerializer(serializers.ModelSerializer) :
    class Meta:
        model = Category
        fields = ('__all__')


class OrderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Order
        fields = ('__all__')


class OrderDetailSerializer(serializers.ModelSerializer) :
    class Meta:
        model = Order
        fields = ('__all__')





class ProductsetSerializer(serializers.ModelSerializer):
    class Meta:
        model = Productset
        fields = ('__all__')


class ProductsetDetailSerializer(serializers.ModelSerializer) :
    class Meta:
        model = Productset
        fields = ('__all__')

class DiscountSerializer(serializers.ModelSerializer):
    class Meta:
        model = Discount
        fields = ('__all__')


class DiscountDetailSerializer(serializers.ModelSerializer) :
    class Meta:
        model = Discount
        fields = ('__all__')


class Discount_pediodSerializer(serializers.ModelSerializer):
    class Meta:
        model = Discount_pediod
        fields = ('__all__')


class Discount_pediodDetailSerializer(serializers.ModelSerializer) :
    class Meta:
        model = Discount_pediod
        fields = ('__all__')

class Discount_brandSerializer(serializers.ModelSerializer):
    class Meta:
        model = Discount_brand
        fields = ('__all__')


class Discount_brandDetailSerializer(serializers.ModelSerializer) :
    class Meta:
        model = Discount_brand
        fields = ('__all__')


