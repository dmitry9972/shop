# Generated by Django 3.2.6 on 2021-08-22 00:00

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0007_auto_20210821_2359'),
    ]

    operations = [
        migrations.AlterField(
            model_name='photo',
            name='product',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='images', to='main.product'),
        ),
    ]
