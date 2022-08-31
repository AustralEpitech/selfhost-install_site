NAME	=	anged/install_site
VERSION	=	0.1

.PHONY:			build build-nocache tag-latest push push-latest release git-tag-version

build:
	docker build -t $(NAME):$(VERSION) .

build-nocache:
	docker build -t $(NAME):$(VERSION) --no-cache .

tag-latest:		build
	docker tag $(NAME):$(VERSION) $(NAME):latest

push:			build
	docker push $(NAME):$(VERSION)

push-latest:	tag-latest
	docker push $(NAME):latest

release:		push push-latest

git-tag-version: release
	git tag -a v$(VERSION) -m "v$(VERSION)"
	git push origin v$(VERSION)
