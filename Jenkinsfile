pipeline {
    agent any


stage('github login'){
 steps {
    	

//    withCredentials([username:$username , password:$password]){
//           git login -u $username -p password
//     }

  }


 stage('pull github repo') {
    steps {
        git  'https://github.com/amirmamdouh123/pipeline_test'    
  } 
}


 stage('login in dockerhub') {
     steps {
           
 	    
    withCredintials([usernameColonPassword(credentialsId:'dockerhublogin' , variable: 'PASSWORD')]){
           docker login -u amirmamdouh123 -p $PASSWORD
     }

    }
  }

 stage('process dockerfile and push ') {
     steps {

     docker build -t amirmamdouh123/test-pipeline .
     
     docker run -itd --name test-pipeline  amirmamdouh123/test-pipeline 

     docker push amirmamdouh123/test-pipeline
    }


   post {

   echo "Nice, I love you <3 ."
}

  }




