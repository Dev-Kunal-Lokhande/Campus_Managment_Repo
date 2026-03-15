function SearchByname(EventName) {
	console.log("Function called:", EventName);
	let xhttp = new XMLHttpRequest();

	xhttp.onreadystatechange = function() {
		console.log("Execute ========");
		if (this.readyState == 4 && this.status == 200) {

			//console.log(this.responseText);

			let tbody = document.getElementById("EventTable");
			console.log(tbody);

			tbody.innerHTML = "";

			let jsonArr = JSON.parse(this.responseText);

			let count = 1;

			jsonArr.forEach(event => {

				console.log("the name is ====", event.name);

				let tr = document.createElement("tr");

				let td1 = document.createElement("td");
				td1.innerHTML = count++;

				let td2 = document.createElement("td");
				td2.innerHTML = event.name;

				let td3 = document.createElement("td");
				td3.innerHTML = event.date;

				let td4 = document.createElement("td");
				td4.innerHTML = event.location;

				tr.appendChild(td1);
				tr.appendChild(td2);
				tr.appendChild(td3);
				tr.appendChild(td4);

				tbody.appendChild(tr);
			});
		}
	};

	xhttp.open("GET", "Search?name=" +EventName, true);

	xhttp.send();
}