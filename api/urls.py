from django.urls import path

from .views import registration_view

from .views import ProductsViewSet, BrandsViewSet, CountryViewSet, PhotoViewSet, \
    Discount_brandViewSet, Discount_pediodViewSet, DiscountViewSet, ProductsetViewSet, \
    OrderViewSet, CategoryViewSet

from rest_framework.authtoken.views import obtain_auth_token

from rest_framework import permissions
from drf_yasg.views import get_schema_view
from django.urls import path, include, re_path
from drf_yasg import openapi

from rest_framework import routers

schema_view = get_schema_view(
    openapi.Info(
        title="Snippets API",
        default_version='v1',
        description="Test description",
        terms_of_service="https://www.google.com/policies/terms/",
        contact=openapi.Contact(email="contact@snippets.local"),
        license=openapi.License(name="BSD License"),
    ),
    public=True,
    permission_classes=(permissions.AllowAny,),
)

urlpatterns = [
    path('swagger/', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
    path('redoc/', schema_view.with_ui('redoc', cache_timeout=0), name='schema-redoc'),
    path('register/', registration_view.as_view(), name='register'),
    path('login/', obtain_auth_token, name='login'),
]

router = routers.SimpleRouter()
router.register(r"products", ProductsViewSet)
router.register(r"brands", BrandsViewSet)
router.register(r"country", CountryViewSet)
router.register(r"photos", PhotoViewSet)
router.register(r"discount_brand", Discount_brandViewSet)
router.register(r"discount_pediod", Discount_pediodViewSet)
router.register(r"discount", DiscountViewSet)
router.register(r"productset", ProductsetViewSet)
router.register(r"order", OrderViewSet)
router.register(r"category", CategoryViewSet)

urlpatterns += router.urls
