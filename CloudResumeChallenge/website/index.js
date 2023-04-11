const counter = document.querySelector(".viewcount");
async function updateCounter(){
    let response = await fetch("https://6lor4hi3ruqxgj4crhyey2y4ya0brdqi.lambda-url.us-east-1.on.aws/");
    let data = await response.json();
    counter.innerHTML = `This page has been viewed ${data} times`;

}

updateCounter();