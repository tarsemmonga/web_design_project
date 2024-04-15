
.PHONY: rebuild log test debug trace

all: rebuild down
	docker-compose up -d

rebuild:
	docker-compose build

down:
	docker-compose down 

log:
	docker-compose logs -f

test: rebuild down
	APP_CONFIG_PROFILE=app.config.TestingConfig docker-compose up -d

trace: rebuild down
	APP_CONFIG_PROFILE=app.config.TraceConfig docker-compose up -d
	
debug: rebuild down
	APP_CONFIG_PROFILE=app.config.DebugConfig docker-compose up -d

nose:
	APP_CONFIG_PROFILE=app.config.TestingConfig nosetests-2.7 app/model/userdatabase.py
	APP_CONFIG_PROFILE=app.config.TestingConfig nosetests-2.7 app/model/userdatabase.py
	APP_CONFIG_PROFILE=app.config.TestingConfig nosetests-3.4 app/views/admin.py
	APP_CONFIG_PROFILE=app.config.TestingConfig nosetests-3.4 app/views/admin.py
