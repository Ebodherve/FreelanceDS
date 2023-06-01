# Generated by Django 3.2.8 on 2023-05-22 11:33

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0004_rename_nom_competence_nom_competence'),
    ]

    operations = [
        migrations.RenameField(
            model_name='competence',
            old_name='nom_competence',
            new_name='nom',
        ),
        migrations.AlterField(
            model_name='competence',
            name='domaine',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='domaine', to='api.domaine'),
        ),
        migrations.AlterField(
            model_name='profile',
            name='competences',
            field=models.ManyToManyField(related_name='competences', to='api.Competence'),
        ),
    ]
