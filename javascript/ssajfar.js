function pravokutnikPomoc(event) {
    var p = event.target.id;
    var pBlok;

    if (p === "pravokutnik") {
        pBlok = document.getElementById("pravokutnik1");
    }
    if (p === "pravokutnik1") {
        pBlok = document.getElementById("pravokutnik2");
    }
    if (p === "pravokutnik2") {
        pBlok = document.getElementById("pravokutnik3");
    }
    if (p === "pravokutnik3") {
        pBlok = document.getElementById("pravokutnik4");
    }
    if (p === "pravokutnik4") {
        pBlok = null;
    }
    if (pBlok !== null) {
        pBlok.style.display = "block";
    }
    event.target.style.display = "none";
}



let provjera = false;

function provjeraDatuma() {
    provjera = false;
    let text = document.getElementById("registrirano").value;

    let dijelovi = text.split(".");

    if (dijelovi.length === 4) {
        if (!isNaN(dijelovi[0]) && !isNaN(dijelovi[1]) && !isNaN(dijelovi[2]) && dijelovi[3] === "") {

            let dan = parseInt(dijelovi[0]);
            let danString = dijelovi[0];
            let mjesec = parseInt(dijelovi[1]);
            let mjesecString = dijelovi[1];
            let godina = parseInt(dijelovi[2]);

            if (godina > 1000 && godina < 2030) {
                if (mjesecString.substring(0, 1) === "1" || mjesecString.substring(0, 1) === "0") {
                    if (danString.substring(0, 1) === "0" || danString.substring(0, 1) === "1" || danString.substring(0, 1) === "2" || danString.substring(0, 1) === "3") {
                        if (dan <= 31 && mjesec <= 12) {
                            if (danString.length === 2 && mjesecString.length === 2) {
                                provjera = true;
                            }

                        }

                    }
                }

            }

        }


    }


    var element = document.getElementById("registriranoLabela");
    if (!provjera) {
        element.classList.add("labelaNeispravno");
        document.getElementById('registriranoLabela').innerHTML = '*Registrirano do';
    } else {
        document.getElementById('registriranoLabela').innerHTML = 'Registrirano do';
        element.classList.remove("labelaNeispravno");
    }
    obrazac();
}

let izbornik = false;
function provjeraIzbornika() {
    izbornik = false;
    padajuci = document.getElementById('zupanija');
    var j = 0;
    var element = document.getElementById("zupanijaLabela");
    for (var i = 0; i < padajuci.options.length; i++) {
        if (padajuci.options[i].selected) {
            j++;
        }
    }
    if (j < 2) {

        element.innerHTML = "*Županije u kojoj se bude kretao:"
        element.classList.add("labelaNeispravno");
    }
    else {
        izbornik = true;

        element.innerHTML = "Županije u kojoj se bude kretao:"
        element.classList.remove("labelaNeispravno");
    }
    obrazac();
}

let vrijeme = false;
function provjeraTexta() {
    if (document.getElementById("vrijeme").value == '') {
        alert("Obavezan unos u polje");
    }
    else {
        vrijeme = true;
    }
    obrazac();
}


function obrazac() {
    if (vrijeme && provjera && izbornik) {
        document.getElementById('submit1').disabled = false;
    }
    else {
        document.getElementById('submit1').disabled = true;
    }
}

function regop() {
    if (!provjera) {
        if (confirm("Trebate li pomoć")) {
            document.getElementById("pravokutnik").style.display = "block";
        } else {
            //
        }
    }
}

function email() {
    let text = document.getElementById("mail").value;
    var element = document.getElementById("emailLabela");
    if (!text.includes("@")) {
        element.classList.add("labelaNeispravno");
        element.innerHTML = '*Email adresa';
    }
    else {
        element.classList.remove("labelaNeispravno");
        element.innerHTML = 'Email adresa';
    }
}


//accesibility gumb se nalazi gore desno 
function accessibilityKlik() {
    let style = document.getElementById("accessibility-style");
    style.disabled = !style.disabled;
}

window.addEventListener('load', function () {
    document.getElementById("pravokutnik").addEventListener("click", pravokutnikPomoc);
    document.getElementById("pravokutnik1").addEventListener("click", pravokutnikPomoc);
    document.getElementById("pravokutnik2").addEventListener("click", pravokutnikPomoc);
    document.getElementById("pravokutnik3").addEventListener("click", pravokutnikPomoc);
    document.getElementById("pravokutnik4").addEventListener("click", pravokutnikPomoc);

    document.getElementById("registrirano").addEventListener("keyup", provjeraDatuma);
    document.getElementById("zupanija").addEventListener("change", provjeraIzbornika);
    document.getElementById('vrijeme').addEventListener("change", provjeraTexta);
    document.getElementById('submit1').disabled = true;

    document.getElementById('registrirano').addEventListener("focusout", regop);
    document.getElementById('mail').addEventListener("focusout", email);
    document.getElementById("accessibility").addEventListener("click", accessibilityKlik);
    document.getElementById("accessibility-style").disabled = true;

});

