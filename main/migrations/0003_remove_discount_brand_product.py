# Generated by Django 3.2.6 on 2021-08-19 10:29

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0002_auto_20210819_1027'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='discount_brand',
            name='product',
        ),
    ]
