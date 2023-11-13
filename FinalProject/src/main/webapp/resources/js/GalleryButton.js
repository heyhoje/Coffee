$(document).ready(function(){
    $(".validate_schema").click(function() {
    
                          if ($('.google-div').hasClass('d-none')) {
                            $('.google-div').removeClass('d-none');
                            $('.validate_schema').empty();
                            $('.validate_schema').html("<i class='bx bx-x'></i>");
                            $('.validate_schema').css('background-color','#000');
    
                          }else{
    
                            $('.google-div').addClass('d-none');
                            $('.validate_schema').empty();
                            $('.validate_schema').html("<i class='bx bxl-google'></i>");
                            $('.validate_schema').css('background-color','green');
                          }
                          
    
    
                        });
    
    });