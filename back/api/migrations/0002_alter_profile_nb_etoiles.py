# Generated by Django 3.2.8 on 2023-05-09 17:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profile',
            name='nb_etoiles',
            field=models.IntegerField(),
        ),
    ]
