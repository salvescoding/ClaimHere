
const url = "https://autocomplete.clearbit.com/v1/companies/suggest?query=";
const results = document.getElementById('results');


function attachEvents() {
    const searchInput = document.getElementById('form-search');

    searchInput.addEventListener('keyup', search);
    searchInput.addEventListener('focus', search);
    searchInput.addEventListener('blur',  () => {setTimeout(clear, 200) });

}


function search(event) {
    const input = event.target;
    const search = input.value;



    if (search.length > 1) {
        fetch(url + input.value)
        .then(response => response.json())
        .then((data) =>  {
          clear();
          results.classList.remove('results-dropdown-transparent');
          data.forEach(function(d){
            let name = d.name;
            let domain = d.domain;
            let logo = d.logo;
            const item = `<li class='item'><img src='${logo}' class='avatar-logo'><a href='/find_company?domain=${domain}&name=${name}&logo=${logo}'>  ${name}</a></li>`;
            results.insertAdjacentHTML("afterbegin", item);
          });
        });
    }
 }



function clear() {
    document.getElementById('results').innerHTML = '';
    results.classList.add('results-dropdown-transparent');
}


document.addEventListener("DOMContentLoaded", attachEvents);
