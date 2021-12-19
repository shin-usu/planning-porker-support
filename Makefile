PRODUCT_NAME := PlanningPorkerSupport

.PHONY: generate-xcodeproj
generate-xcodeproj:
	mint run xcodegen generate
	make open

.PHONY: open
open:
	open ./${PRODUCT_NAME}.xcodeproj