# Generated by Django 3.2.8 on 2023-05-30 17:31

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('api', '0024_auto_20230523_1329'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profileentreprise',
            name='description',
            field=models.CharField(blank=True, max_length=1000),
        ),
        migrations.AlterField(
            model_name='profileentreprise',
            name='image',
            field=models.ImageField(default='', null=True, upload_to='photos_profiles/'),
        ),
        migrations.AlterField(
            model_name='profileentreprise',
            name='nom',
            field=models.CharField(blank=True, max_length=255),
        ),
        migrations.AlterField(
            model_name='profileentreprise',
            name='user',
            field=models.OneToOneField(blank=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
    ]