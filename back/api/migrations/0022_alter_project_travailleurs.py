# Generated by Django 3.2.8 on 2023-05-23 12:41

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('api', '0021_alter_project_travailleurs'),
    ]

    operations = [
        migrations.AlterField(
            model_name='project',
            name='travailleurs',
            field=models.ManyToManyField(blank=True, default=True, related_name='travailleurs', to=settings.AUTH_USER_MODEL),
        ),
    ]
