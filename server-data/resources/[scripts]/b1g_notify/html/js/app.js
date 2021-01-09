

window.addEventListener('message', function (event) {
    ShowNotif(event.data);
});

function ShowNotif(data) {
	$("#desc").empty();
	if (data.type === 'importante') {
		launch_importante(data);
    }
	else if (data.type === 'sucesso') {
       launch_successo(data);
    } 
	else if (data.type === 'negado') {
       launch_negado(data);
    } 
	else if (data.type === 'aviso') {
       launch_aviso(data);
    } 
}

function launch_importante(data) {
    var x = document.getElementById("toast")
    x.className = "show";
	document.getElementById("image").src = "https://image.flaticon.com/icons/svg/189/189664.svg";
	document.getElementById("toast").style.backgroundColor = "rgba(50, 50, 140, 0.8)";
	document.getElementById("toast").style.borderRadius = "25px"
	document.getElementById("toast").style.borderStyle = "none"
	document.getElementById("desc").style.color = "#fff";
	$("#desc").append(`${data.text}`)
	setTimeout(function(){ x.className = x.className.replace("show", "disappear"); }, 5000);
	
}

function launch_aviso(data) {
    var x = document.getElementById("toast")
    x.className = "show";
	document.getElementById("image").src = "https://image.flaticon.com/icons/svg/196/196759.svg";
	document.getElementById("toast").style.backgroundColor = "rgba(20, 187, 196, 0.8)";
	document.getElementById("toast").style.borderRadius = "25px"
	document.getElementById("toast").style.borderStyle = "none"
	document.getElementById("desc").style.color = "#fff";
	$("#desc").append(`${data.text}`)
    setTimeout(function(){ x.className = x.className.replace("show", "disappear"); }, 5000);
}


function launch_successo(data) {
    var x = document.getElementById("toast")
    x.className = "show";
	document.getElementById("image").src = "https://image.flaticon.com/icons/svg/190/190411.svg";
	document.getElementById("toast").style.backgroundColor = "rgba(91, 212, 159, 0.8)";
	document.getElementById("toast").style.borderRadius = "25px"
	document.getElementById("toast").style.borderStyle = "none"
	document.getElementById("desc").style.color = "#fff"
	$("#desc").append(`${data.text}`)
	setTimeout(function(){ x.className = x.className.replace("show", "disappear"); }, 5000);
}

function launch_negado(data) {
    var x = document.getElementById("toast")
    x.className = "show";
	document.getElementById("image").src = "https://image.flaticon.com/icons/svg/190/190406.svg";
	document.getElementById("toast").style.backgroundColor = "rgba(179, 34, 27, 0.8)";
	document.getElementById("toast").style.borderRadius = "25px"
	document.getElementById("desc").style.color = "#fff"
	document.getElementById("toast").style.borderStyle = "none"
	$("#desc").append(`${data.text}`)
    setTimeout(function(){ x.className = x.className.replace("show", "disappear"); }, 5000);
}