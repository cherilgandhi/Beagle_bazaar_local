# Generated by Django 3.0.4 on 2022-02-14 10:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('backoffice', '0003_delete_generatebillimgupload'),
    ]

    operations = [
        migrations.AddField(
            model_name='profile',
            name='user_position',
            field=models.CharField(blank=True, max_length=11, null=True),
        ),
    ]
