# make sure you are in the main directory of the project before you run any make cmd

start_redis_container:
	@echo "Starting Docker container for Redis"
	docker compose up


stop_redis_container:
	@echo "Stopping Docker container for Redis"
	docker compose down


start_celery_worker:
	@echo "Starting celery worker..."
	@$(MAKE) inner_worker

inner_worker:
	cd src && celery -A cfehome worker --beat -l info


start_jupyter_notebook:
	@echo "Starting Jupyter Notebook..."
	jupyter notebook