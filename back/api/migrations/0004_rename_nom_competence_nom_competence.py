# Generated by Django 3.2.8 on 2023-05-09 17:43

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0003_rename_competence_profile_competences'),
    ]

    operations = [
        migrations.RenameField(
            model_name='competence',
            old_name='nom',
            new_name='nom_competence',
        ),
    ]
