# Generated by Django 3.2.6 on 2021-08-19 10:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='discount_pediod',
            name='expire',
        ),
        migrations.AddField(
            model_name='product',
            name='name',
            field=models.CharField(db_index=True, default='Продукт <built-in function id>', max_length=100, unique=True, verbose_name='Наименование'),
        ),
    ]
