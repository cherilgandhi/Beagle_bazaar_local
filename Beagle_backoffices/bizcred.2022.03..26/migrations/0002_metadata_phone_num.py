# Generated by Django 3.0.4 on 2022-02-28 11:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('bizcred', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='metadata',
            name='phone_num',
            field=models.CharField(blank=True, max_length=10, null=True),
        ),
    ]
