# Generated by Django 4.2.6 on 2023-10-27 08:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0003_rename_number_of_queen_bedrooms_property_number_of_guest_allowed'),
    ]

    operations = [
        migrations.AddField(
            model_name='property',
            name='number_of_beds',
            field=models.PositiveIntegerField(null=True),
        ),
    ]