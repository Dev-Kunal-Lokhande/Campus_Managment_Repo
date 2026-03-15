function SearchByname(EventName) {
	if (EventName.trim() === "") {
		location.reload();
		return;
	}

	let xhttp = new XMLHttpRequest();

	xhttp.onreadystatechange = function() {

		if (this.readyState == 4) {

			let tbody = document.getElementById("EventTable");
			tbody.innerHTML = "";

			if (this.status == 200) {

				let jsonArr = JSON.parse(this.responseText);

				let count = 1;

				if (jsonArr.length == 0) {
					tbody.innerHTML = "<tr><td colspan='4'>Data Not Found</td></tr>";
					tbody.className="text-center"
					return;
				}

				jsonArr.forEach(event => {

					let tr = document.createElement("tr");

					let td1 = document.createElement("td");
					td1.innerHTML = event.id;

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
		}
	};

	xhttp.open("GET", "Search?name=" + EventName, true);
	xhttp.send();
}