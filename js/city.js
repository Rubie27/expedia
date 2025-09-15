$(document).ready(function() {
    const addnewbutton = $('#addnewcity'),
         citydetailsmodal = $('#citydetailsmodal'),
         filtercountrylist = $('#filtercountry'),
         citycountrylist = $('#citydetailscountry')
    //    load countries from the database
    getcountries(filtercountrylist, 'all')
    getcountries(citycountrylist)

    // listen to city click button show modal
    addnewbutton.on('click', function() {
        citydetailsmodal.modal('show')
    })

    function getcountries(obj, option = 'choose') {
        $.getJSON(
            "controllers/countryoperations.php",  // end point
            {
                getcountries: true
            }
        ).done(function(data) { // if success then execute the function
            // console.log('Countries:', data);
            let results=option=='choose'? 
            `<option value=''>&lt;Choose&gt;</option>`:
            `<option value='0'>&lt;All&gt;</option>`
            data.forEach(function (country){
                results += `<option value="${country.countryid}">${country.name}</option>`
            })
            obj.html(results)
        }).fail(function(Response,status,error){ // else if failure then execute the function

        })

    }
})