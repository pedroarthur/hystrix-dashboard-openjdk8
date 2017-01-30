
-include make/local.mk

docker-image: build
	cp dashboard/build/libs/standalone-hystrix-dashboard-*-all.jar \
		 docker/standalone-hystrix-dashboard.jar
	cd docker; docker build \
		--build-arg  http_proxy=$(http_proxy) \
		--build-arg https_proxy=$(https_proxy) \
		-t hystrix-dashboard-openjdk8 .

build: dashboard/.git
	cd dashboard; gradlew $(GRADLEW_OPTIONS) fatJar

dashboard/.git:
	git clone https://github.com/kennedyoliveira/standalone-hystrix-dashboard dashboard

clean:
	find . -name '*~' | xargs -r rm

