# Generated by Django 3.2.8 on 2023-05-22 21:57

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('api', '0017_project_fini'),
    ]

    operations = [
        migrations.AlterField(
            model_name='project',
            name='travailleurs',
            field=models.ManyToManyField(default=True, related_name='travailleurs', to=settings.AUTH_USER_MODEL),
        ),
    ]
