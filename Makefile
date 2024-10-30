.PHONY: all run_dev_web run_dev_mobile run_unit clean upgrade lint format build_dev_mobile help 

all: lint format run_dev_mobile

# Adding a help file: https://gist.github.com/prwhite/8168133#gistcomment-1313022
help: ## This help dialog.
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
		IFS=$$'#' ; \
		help_split=($$help_line) ; \
		help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		printf "%-30s %s\n" $$help_command $$help_info ; \
	done

run_unit: ## Runs unit tests
	@echo "╠ Running the tests"
	@flutter test || (echo "Error while running tests"; exit 1)

clean: ## Cleans the environment
	@echo "╠ Cleaning the project..."
	@rm -rf pubspec.lock
	@flutter clean

format: ## Formats the code
	@echo "╠ Formatting the code"
	@dart format . -l 120

lint: ## Lints the code
	@echo "╠ Verifying code..."
	@dart analyze . || (echo "Error in project"; exit 1)

upgrade: clean ## Upgrades dependencies
	@echo "╠ Upgrading dependencies..."
	@flutter pub upgrade

get:  ## get dependencies
	@echo "╠ getting dependencies..."
	@flutter packages pub get


commit: format lint
	@echo "╠ Committing..."
	git add .
	git commit

run_dev_web: ## Runs the web application in development
	@echo "╠ Running the app"
	@flutter run -d chrome --dart-define=ENVIRONMENT=dev

run_dev_mobile: ## Runs the mobile application in development
	@echo "╠ Running the app"
	@flutter run --flavor development

build_dev: clean ## Build apk for development flavor
	@echo "╠  Building the app"
	@echo "╠  flavor = development"
	@flutter build apk --flavor development -t lib/main_development.dart

build_apk: clean ## Build apk for development flavor
	@echo "╠  Building the apk"
	@flutter build apk -t lib/main.dart

build_stg: clean ## Build apk for staging flavor
	@echo "╠  Building the app"
	@echo "╠  flavor = Staging"
	@flutter build apk --flavor staging -t lib/main_staging.dart

build_prod: clean ## Build appble for production flavor and uploading to store
	@echo "╠  Building the app"
	@echo "╠  flavor = production"
	@flutter build appbundle --release --flavor production -t lib/main_production.dart

build_runner: ## Build appble for production flavor and uploading to store
	@echo "╠  Running build to generate files"
	@flutter pub run build_runner watch --delete-conflicting-outputs

build_format: ## run build_runner and format files
	@echo "╠  Running build to generate files"
	@dart run build_runner build --delete-conflicting-outputs
	@echo "╠ Formatting the code"
	@dart format . -l 120

bf: ## run build_runner and format files
	@echo "╠  Running build to generate files"
	@dart run build_runner build --delete-conflicting-outputs
	@echo "╠ Formatting the code"
	@dart format . -l 120

clean_unused_local: ## List and clean unused localizations
	@echo "╠  Listing unused terms in localizations"
	@dart run translations_cleaner list-unused-terms
	@echo "╠ Cleaning unused terms in localizations "
	@dart run translations_cleaner clean-translations

list_unused_local: ## Just listing unused localizations
	@echo "╠  Listing unused terms in localizations"
	@dart run translations_cleaner list-unused-terms
	
remove_unused_png: #Just listing unused png images	
	@echo "╠  Running unused assets png images"
	@ flutter pub run delete_un_used_assets:start /assets/images/png

remove_unused_svg: ## Just listing unused svg images
	@echo "╠  Running unused assets svg images"
	@ flutter pub run delete_un_used_assets:start /assets/images/svg

fire: # Install flutterfire
	@echo "╠ Running Global Active Flutter Fire Client"
	@dart pub global activate flutterfire_cli
	@echo "╠ Running Flutter Fire Configure"
	@flutterfire configure
	
splash: # Setup splash screen
	@echo "╠ Running flutter clean"
	@flutter clean
	@echo "╠ Running flutter pub get"
	@flutter pub get
	@echo "╠ Running flutter pub run flutter_native_splash:remove"
	@flutter pub run flutter_native_splash:remove
	@echo "╠ Running flutter pub run flutter_native_splash:create"
	@flutter pub run flutter_native_splash:create

podrepo: ## Run pod install
	@echo "╠  Removing Podfile.lock"
	@rm -rf ios/Podfile.lock
	@echo "╠  Running pod install --repo-update"
	@cd ios && pod install --repo-update
	@echo "╠  Done"
	@cd ..

cgr: ## Clean & Get & Repo update use root project directory!
	@echo "╠ Cleaning the project..."
	@rm -rf pubspec.lock
	@flutter clean
	@echo "╠ getting dependencies..."
	@flutter pub get
	@echo "╠  Removing Podfile.lock"
	@rm -rf ios/Podfile.lock
	@echo "╠  Running pod install --repo-update"
	@cd ios && pod install --repo-update
	@echo "╠  Done"
	@cd ..

cg: ## Clean & Pub Get 
	@echo "╠ Make clean running..."
	@make clean
	@echo "╠ Make get running..."
	@make get