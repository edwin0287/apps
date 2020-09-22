# Generated by Django 3.0.7 on 2020-09-21 22:31

import datetime
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Event',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=120)),
                ('description', models.CharField(blank=True, max_length=120, null=True)),
                ('content', models.TextField(blank=True, null=True)),
                ('category', models.CharField(choices=[('drama', 'Drama'), ('musica', 'Musica'), ('cultura', 'Cultural'), ('covers', 'Covers')], default='musica', max_length=50)),
                ('date_event', models.DateTimeField(blank=True, null=True)),
                ('date_created', models.DateTimeField(blank=True, default=datetime.datetime.now)),
                ('costo', models.DecimalField(decimal_places=2, max_digits=5, null=True)),
                ('url', models.CharField(max_length=2048, null=True)),
                ('thumbnail', models.ImageField(blank=True, null=True, upload_to='photos/%Y/%m/%d/')),
            ],
        ),
        migrations.CreateModel(
            name='UserAccountEvent',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date_created', models.DateTimeField(blank=True, default=datetime.datetime.now)),
                ('User_id', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('event_id', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='events.Event')),
            ],
        ),
    ]
