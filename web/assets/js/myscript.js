function one() {
    document.write("<h2> this is function calling 1</h2>");
}
function two() {

    document.write("<font color='blue' size='5'> This is function calling 2</font>");
}

function welcome(x){
    document.write("<h2> Welcome " + x.value + "</h2>");
}

function add(x,y){
    sum = parseInt(x.value) + parseInt(y.value);
    alert('Sum = '+sum);
}
function clearData(x,y){
    if(confirm("do you really want to delete")) {
    x.value="";
    y.value="";
    }
}

function add2(){
 x = parseInt(prompt("enter first no ",0));
 y = parseInt(prompt("enter second no ",0));
 c = x+y;
 alert("sum =  " +c);
}

function show(x,y){
    y.innerHTML = String(x.value).toUpperCase();
}

function upper(x,y){
    y.innerHTML ="upper case is :  " +  String(x.value).toUpperCase();
}

function countChar(x,y){
    if(String(x.value).length<8)
        y.innerHTML= "<font color='red'>weak password</font>";
    else 
        y.innerHTML="<font color='blue'>Strong password</font>";
}

var persons=[];
function addDetails(nm,age,gen1,gen2){
   // alert('data received');
   gender = '';
   if (gen1.checked)
       gender= gen1.value;
   else if (gen2.checked)
       gender=gen2.value;
   person ={'name':nm.value, 'age':age.value,'gender':gender};
   persons.push(person);
   //reading other  elements of Body-
   table = document.getElementById('tab1');
   table.innerHTML ="<tr><td>Name</td><td>Age</td><td>Gender</td><td>Operations</td></tr>";
   for (p in persons)
   {
       table.innerHTML +=  "<tr><td>"+persons[p].name+"</td><td>"+ persons[p].age +"</td><td>"+ persons[p].gender +"</td><td><a href='#' onclick='deleteData("+ p+ ");'>Delete</a></tr>";
   
      }
     nm.value='';age.value=''; gen1.checked=false; gen2.checked=false;
}

function deleteData(index){
    delete persons[index];
    table.innerHTML ="<tr><td>Name</td><td>Age</td><td>Gender</td><td>Operations</td></tr>";
   for (p in persons)
   {
       table.innerHTML +=  "<tr><td>"+persons[p].name+"</td><td>"+ persons[p].age +"</td><td>"+ persons[p].gender +"</td><td><a href='#' onclick='deleteData("+ p+ ");'>Delete</a></tr>";
   
      }
     nm.value='';age.value=''; gen1.checked=false; gen2.checked=false;
}