# Generated by Django 3.2.8 on 2023-05-09 17:41

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0002_alter_profile_nb_etoiles'),
    ]

    operations = [
        migrations.RenameField(
            model_name='profile',
            old_name='competence',
            new_name='competences',
        ),
    ]