const counter = document.querySelector(".viewscount");
async function updateCounter(){
    let response = await fetch("");
    let data = await response.json();
    counter.innerHTML = `This page has been viewed ${data} times`;

}