/**
 * 
 */
 function wishInsert(pcode){
			$.ajax({
				url : "wishListInsert",
				data : {p_code:pcode},
				dataType :'text',
				beforeSend : function(httpRequest){
					httpRequest.setRequestHeader("AJAX", "true");
				},
				success : function(data){
					if(data > 0){
						var result;
						result = confirm("위시리스트에 추가되었습니다.\n위시리스트로 이동하시겠습니까?");
						if(result == true){
							location.href="wishList";
						}
					}else{
						alert("위시리스트에 이미 추가된 상품입니다.");
					}
				},
				error : function onError (error){
					if(error.status == 400){
						alert("로그인 후 이용 가능합니다.");
						location.href="cm/loginForm";
					}else{
						alert("위시리스트 추가에 실패하였습니다.\n관리자에게 문의하세요.");
					}
				}
			});
		
	}
