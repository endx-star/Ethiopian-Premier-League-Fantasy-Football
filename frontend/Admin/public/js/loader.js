document.onreadystatechange = function() {
	if (document.readyState !== "complete") {
		document.querySelector("body").style.visibility = "hidden";
		document.querySelector("#loading-center").style.visibility = "visible";
	} else {
		document.querySelector("#loading-center").style.display = "none";
		document.querySelector("body").style.visibility = "visible";
	}
};
