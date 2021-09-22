$(document).ready(function () {

    naslov = $(document).find("title").text();

    switch (naslov) {
        case "Početna stranica":
            $(document).ready(function () {
                $('#tablica').DataTable({
                    /* "pageLength": 50 */
                });
            });
            break;
        case "Galerija vlakova":

            document.getElementById("dodajSliku").addEventListener("click", ucitaj);
            $('figure').click(function () {
                dohvatiTip(this);
            });


            break;

        case "Registracija":

            popuniPolja();

            $("#datum").keyup(function (event) {

                var datum = $("#datum").val();
                var re1 = new RegExp((/^([1][9][0-9][0-9]|[2-9][0-9][0-9][0-9])[\/](0?[1-9]|[12][0-9]|3[01])[\/](0?[1-9]|1[012]) ((0?[1-9])|[1][0-2])[\:](0?[1-9]|[12345][0-9]) ([A]|[P])[M]$/));
                var re2 = new RegExp((/^(0?[1-9]|[12][0-9]|3[01])[\.](0?[1-9]|1[012])[\.]([1][9][0-9][0-9]|[2-9][0-9][0-9][0-9])[\.] (0?[0-9]|[1][0-9]|[2][0-3]):(0?[1-9]|[12345][0-9])$/));
                var ok1 = re1.test(datum);
                var ok2 = re2.test(datum);
                if (!ok1 && !ok2) {
                    $("#datum").attr("style", "border-color:red");
                    greske = true;
                } else {
                    $("#datum").attr("style", "border-color:green");
                    greske = false;
                }

                $("#prijava").submit(function (event) {
                    event.preventDefault();

                });
            });

            var imena = new Array();

            $.getJSON("../json/imena.json",
                    function (data) {
                        $.each(data, function (key, val) {
                            imena.push(val);
                        });
                    });

            $('#ime').autocomplete({
                source: imena
            });


            $('#prez').autocomplete({
                source: imena
            });

            break;



    }

    let popisSlika = [];
    function ucitaj() {
        $.ajax({
            url: 'https://barka.foi.hr/WebDiP/2020/materijali/zadace/dz3/userNameSurname.php?all',
            type: 'GET',
            dataType: 'xml',
            success: function (xml) {
                $(xml).find("korisnik").each(function () {
                    let imePrezime = $(this).find("podaci").find("imePrezime").text();
                    let slika = $(this).find("slika").attr('url').split("/");
                    let nazivSlike = slika[slika.length - 1];
                    popisSlika.push({
                        imePrezime,
                        nazivSlike
                    });
                });
                prikaziSlike();
            },
            error: function (xml) {
                //

            }
        });


    }




    function dohvatiTip(element) {
        let caption = $(element).find("figcaption").text().split(" ");
        let ime = caption[0];
        let prezime = caption[1];
        $.ajax({
            url: 'https://barka.foi.hr/WebDiP/2020/materijali/zadace/dz3/userNameSurname.php?ime=' + ime + '&prezime=' + prezime,
            type: 'GET',
            dataType: 'xml',
            success: function (xml) {
                let tip = $(xml).find("tip").text();
                if (tip == -1) {
                    alert("Greška kod učitavanja");
                } else {
                    let border = "solid " + 2 * tip + "px red";
                    $(element).find("img").css('border', border);

                    let username = $(xml).find("username").text();

                    document.cookie = "podaci=username='" + username + "'&ime='" + ime + "'&prezime='" + prezime + "'&tip='" + tip + "'";
                }
            },
            error: function (xml) {
                //

            }
        });
    };


    function prikaziSlike() {
        $('figure').each(function () {
            let figure = $(this);
            let slika = figure.find("img").attr('src').split("/");
            let naziv = slika[slika.length - 1];
            let caption = figure.find("figcaption");
            /* console.log(naziv); */
            //console.log($(this).find("img").attr('src'));

            $(popisSlika).each(function (idx, el) {
                if (naziv === el.nazivSlike) {
                    figure.attr('hidden', false);
                    caption.text(el.imePrezime);
                    return false;
                }
            });
        });
    };

    function popuniPolja() {
        let cookie = dohvatiCookie();
        if (cookie !== "") {
            let username = dohvatiVrijednost('username', cookie);
            let ime = dohvatiVrijednost('ime', cookie);
            let prezime = dohvatiVrijednost('prezime', cookie);

            $('#ime').val(ime);
            $("#ime").prop('disabled', true);
            $('#prez').val(prezime);
            $("#prez").prop('disabled', true);
            $('#korime').val(username);
            $("#korime").prop('disabled', true);

            popuniLozinku(username);
        }

        
    };

    function dohvatiCookie() {
        let kolacic = "";
        let trazi = "podaci";
        let kolacici = document.cookie;
        if (kolacici.length > 0) {
            pocetak = kolacici.indexOf(trazi);
            if (pocetak !== -1) {
                kolacici = kolacici.substring(pocetak + trazi.length + 1, kolacici.length);
                kraj = kolacici.indexOf(";");
                if (kraj === -1) {
                    kraj = kolacici.length;
                }
                mojKolacic = kolacici.substring(pocetak, kraj);
                if (mojKolacic !== null || mojKolacic.length() > 0) {
                    kolacic = mojKolacic;
                }
            }
        }
        return kolacic;
    };

    function dohvatiVrijednost(naziv, cookie) {
        let pocetak = cookie.indexOf(naziv);
        if (pocetak !== -1) {
            pocetak = pocetak + naziv.length + 2;
            let ostatak = cookie.substring(pocetak);
            return ostatak.substring(0, ostatak.indexOf('\''));
        }
    };

    function popuniLozinku(username) {

        $.ajax({
            url: 'https://barka.foi.hr/WebDiP/2020/materijali/zadace/dz3/korisnici.json',
            type: 'GET',
            dataType: 'json',
            success: function (json) {
                let lozinka = "";
                $(json).each(function (idx, el) {
                    if (el.korisnicko_ime == username) {
                        lozinka = el.lozinka;
                    }
                });

                if (lozinka !== "") {
                    $('#lozinka1').val(lozinka);
                    $("#lozinka1").prop('disabled', true);
                    $('#lozinka2').val(lozinka);
                    $("#lozinka2").prop('disabled', true);
                }
            },
            error: function (json) {
                //

            }
        });
    };

});















// // var fileExt = {},
// //     fileExt[0]=".png",
// //     fileExt[1]=".jpg",
// //     fileExt[2]=".gif";
// // $.ajax({
// //     //This will retrieve the contents of the folder if the folder is configured as 'browsable'
// //     url: '../../Images/Avatar/',
// //     success: function (data) {
// //        $("#fileNames").html('<ul>');
// //        //List all png or jpg or gif file names in the page
// //        $(data).find("a:contains(" + fileExt[0] + "),a:contains(" + fileExt[1] + "),a:contains(" + fileExt[2] + ")").each(function () {
// //            var filename = this.href.replace(window.location.host, "").replace("http:///", "");
// //            $("#fileNames").append( "<li>" + filename + "</li>");
// //        });
// //        $("#fileNames").append('</ul>');
// //      }     
// //   });




// //čitanje kolačiča
// trazi = "WebDiP=";
// //alert(document.cookie);
// kolacici = document.cookie;
// if (kolacici.length > 0) {
//     pocetak = kolacici.indexOf(trazi);
//     if (pocetak !== -1) {
//         kolacici = kolacici.substring(pocetak + trazi.length, kolacici.length);
//         kraj = kolacici.indexOf(";");
//         if (kraj === -1) {
//             kraj = kolacici.length;
//         }
//         mojKolacic = kolacici.substring(pocetak, kraj);
//         if (mojKolacic !== null || mojKolacic.length() > 0) {
//             alert("Vrijednost kolačića: " + mojKolacic);
//         }
//     }
// }

// // brisanje kolačića iz druge stranice; znamo tko je kreirao kolačić
// // document.cookie = 'WebDiP=; Max-Age=0; path=/;';

