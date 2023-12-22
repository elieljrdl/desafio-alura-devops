FROM python:3.9

WORKDIR /app

COPY . .

COPY requirements.txt .  
RUN pip install --no-cache-dir -r requirements.txt

RUN python manage.py migrate
RUN echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('admin', 'admin@example.com', 'adminpassword')" | python manage.py shell


EXPOSE 8000


ENTRYPOINT ["python", "manage.py", "runserver", "0.0.0.0:8000"]