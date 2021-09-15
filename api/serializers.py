from rest_framework import serializers
from main.models import AdvUser, Product, Brand, \
    Country, Photo, Category, \
    Order, Productset, Discount, Discount_pediod, Discount_brand


class RegistrationSerializer(serializers.ModelSerializer):
    password2 = serializers.CharField(style={'input_type': 'password'}, write_only=True)

    class Meta:
        model = AdvUser
        fields = ('username', 'email', 'password', 'password2')
        extra_kwargs = {
            'password': {'write_only': True}
        }

    def save(self):
        account = AdvUser(
            email=self.validated_data['email'],
            username=self.validated_data['username'],
        )
        password = self.validated_data['password']
        password2 = self.validated_data['password2']

        if password != password2:
            raise serializers.ValidationError({'password': 'Passwords must match!'})

        account.set_password(password)
        account.save()
        return account


class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = ('__all__')


class ProductDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = ('__all__')


class BrandSerializer(serializers.ModelSerializer):
    class Meta:
        model = Brand
        fields = ('__all__')


class BrandDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = Brand
        fields = ('__all__')


class CountrySerializer(serializers.ModelSerializer):
    class Meta:
        model = Country
        fields = ('__all__')


class CountryDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = Country
        fields = ('__all__')


class PhotoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Photo
        fields = ('__all__')


class PhotoDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = Photo
        fields = ('__all__')


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ('__all__')


class CategoryDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ('__all__')


class OrderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Order
        fields = ('__all__')


class OrderDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = Order
        fields = ('__all__')


class ProductsetSerializer(serializers.ModelSerializer):
    class Meta:
        model = Productset
        fields = ('__all__')


class ProductsetDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = Productset
        fields = ('__all__')


class DiscountSerializer(serializers.ModelSerializer):
    class Meta:
        model = Discount
        fields = ('__all__')


class DiscountDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = Discount
        fields = ('__all__')


class Discount_pediodSerializer(serializers.ModelSerializer):
    class Meta:
        model = Discount_pediod
        fields = ('__all__')


class Discount_pediodDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = Discount_pediod
        fields = ('__all__')


class Discount_brandSerializer(serializers.ModelSerializer):
    class Meta:
        model = Discount_brand
        fields = ('__all__')


class Discount_brandDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = Discount_brand
        fields = ('__all__')
