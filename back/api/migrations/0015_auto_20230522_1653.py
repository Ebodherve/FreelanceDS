# Generated by Django 3.2.8 on 2023-05-22 16:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0014_auto_20230522_1538'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profile',
            name='image',
            field=models.ImageField(default='', null=True, upload_to='photos_profiles/'),
        ),
        migrations.AlterField(
            model_name='profileentreprise',
            name='image',
            field=models.ImageField(default='', upload_to='photos_profiles/'),
        ),
    ]