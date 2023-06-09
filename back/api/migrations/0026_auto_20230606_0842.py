# Generated by Django 3.2.8 on 2023-06-06 08:42

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('api', '0025_auto_20230530_1731'),
    ]

    operations = [
        migrations.AlterField(
            model_name='postulat',
            name='project',
            field=models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, to='api.project'),
        ),
        migrations.AlterField(
            model_name='postulat',
            name='somme_demande',
            field=models.IntegerField(blank=True),
        ),
        migrations.AlterField(
            model_name='postulat',
            name='text',
            field=models.CharField(blank=True, max_length=2000),
        ),
        migrations.AlterField(
            model_name='postulat',
            name='user',
            field=models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='project',
            name='createur',
            field=models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, related_name='createur', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='project',
            name='description',
            field=models.CharField(blank=True, max_length=1000),
        ),
        migrations.AlterField(
            model_name='project',
            name='devise',
            field=models.ForeignKey(blank=True, default=True, on_delete=django.db.models.deletion.CASCADE, related_name='devise', to='api.unitedevise'),
        ),
        migrations.AlterField(
            model_name='project',
            name='fini',
            field=models.CharField(blank=True, choices=[('fini', 'fini'), ('non fini', 'non fini')], default=True, max_length=255),
        ),
        migrations.AlterField(
            model_name='project',
            name='max_prix',
            field=models.IntegerField(blank=True),
        ),
        migrations.AlterField(
            model_name='project',
            name='min_prix',
            field=models.IntegerField(blank=True),
        ),
        migrations.AlterField(
            model_name='project',
            name='titre',
            field=models.CharField(blank=True, max_length=255),
        ),
    ]
