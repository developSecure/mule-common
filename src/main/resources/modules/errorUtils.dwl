%dw 2.0

fun buildErrorResponse(error: Object) = {
	error: {
		errorType: "$(error.errorType.namespace):$(error.errorType.identifier)",
	    errorMessage: ((error.detailedDescription splitBy(/\n|\"/)) filter $ != "")[0],
	    timestamp: now() as String {format: "YYYY-MM-DD'T'HH:mm:ss"}
	}
}