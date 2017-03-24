function gfn_eco_searchword(strWord)
{ 
	
   var arrSplit = strWord.split(' ');
   var strReturn = "";
   
   for (var i=0; i<arrSplit.length; i++)
   {
    if (arrSplit[i].length > 0)
    {
     strReturn += ",'" + arrSplit[i].replace(/'/g, "''") + "'";      
    } 
   }
   
   strReturn = strReturn.substring(1,strReturn.length)
   if(strReturn.length >0){
	   return strReturn.toUpperCase();
   }else{
	   return "''";
   }
}

	// 앞공백 제거
	function ltrim(str){
		var i, j = 0;
		var objstr;
		for (i=0;i<str.length;i++){
			if (str.charAt(i) == ' ')j=j+1;
			else break;
		}
		return str.substring(j, str.length - j + 1);
	}
	
	// 뒤 공백 제거
	function rtrim(str){
		var i, j = 0;
		for (i=str.length-1;i>=0;i--){
			if(str.charAt(i)==' ') j=j+1;
			else break;
		}
		return str.substring(0, str.length - j);
	}

	// 공백제거
	function trimValue(s){
		s = s.replace(/^\s*/, "").replace(/\s*$/, "");
		return s
	}
	
	// Null Check
	function isNull(str)
	{
		var textValue = str + "";
		if (trimValue(textValue).length == 0 || trimValue(textValue) == null
				|| trimValue(textValue) == "null") return true;
		else return false;
	}

	// Not Null check
	function isChkNotNull(str){
		var textValue = str + "";
		return isNull(textValue) == false;
	}

	// Null 일대 Data 변경
	function toNotNull(str, str_val){
		if (isNull(str) == true) return str_val;
		else return str;
	}

	// Null 일때 0으로 변경
	function nullToZero(nVal){
		var textValue = nVal + "";
	
		if ((trimValue(textValue).length) == 0 || trimValue(textValue) == null || textValue == "null") return 0;
		else return parseInt(nVal);
	}
	
	// Null 일대 공백 처리
	function nullToSpace(nVal){
		var textValue = nVal + "";
	
		if((trimValue(textValue).length) == 0 || trimValue(textValue) == null || textValue == "null") return "";
		else return nVal;
	}
	
	// checked Count
	function checkCount(name){
		var cnt = 0;
		var obj = document.getElementsByName(name);
		if(obj.length == undefined){
			if(obj.checked == true) cnt = 1;
		}else{
			for(i=0;i<obj.length;i++){
				if(obj[i].checked == true) cnt++;
			}
		}
		return cnt;
	}
	
	// 1 checked value
	function checkValue(name){
		var val = 0;
		var obj = document.getElementsByName(name);
		if(obj.length == undefined){
			if(obj.checked == true) val = obj.value;
		}else{
			for(i=0;i<obj.length;i++){
				if(obj[i].checked == true) val = obj[i].value;
			}
		}
		return val;
	}
	
	function checkAll(checkFlag, name){
		var obj = document.getElementsByName(name);
		if(obj.length == undefined){
			obj.checked = checkFlag;
		}else{
			
			for(i=0;i<obj.length;i++){
				obj[i].checked = checkFlag;
				if( $(obj[i]).parent().hasClass('chkWrap') ) {
					if( checkFlag )
						$(obj[i]).parent().addClass('selected');
					else
						$(obj[i]).parent().removeClass('selected');
				}	
			}
		}
	}
	
	
	// Radio 버튼의 값이 맞는 것을 Checked 한다.
	function checkRadio(name, val){
		var obj = document.getElementsByName(name);
		for(i=0;i<obj.length;i++){
			if(obj[i].value == val){
				obj[i].checked = true;
			}
		}
	}
	
	// radio clear
	function clearRadio(name){
		var obj = document.getElementsByName(name);
		for(i=0;i<obj.length;i++){
			obj[i].checked = false;
		}
	}
	
	
	function limitCharacters(textid, limit, limitid){
		 var text = $('#'+textid).val();
		 var input = byteCheck(text);
		 if(input > limit)
		 {
			 $('#' + limitid).html('Remaning bytes : 0');
			 var enterCnt = text.split('\n');
			 $('#'+textid).val(text.substring(0,Number(limit-(enterCnt.length-1)*2)));
			 return false;
		 }else{
			 $('#' + limitid).html('Remaning bytes : '+ (limit - input));
			 return true;
		 }
    }
	
	function byteCheck(code){
		var code_byte = 0;
	    for (var inx = 0; inx < code.length; inx++) {
	    	/*   var oneChar = escape(code.charAt(inx));
	        alert(oneChar);
	        if ( oneChar.length == 1 ) {
	            code_byte ++;
	        } else if (oneChar.indexOf("%0A") != -1) {
	            code_byte += 3;
	        } else if (oneChar.indexOf("%20") != -1) {
	            code_byte += 1;
	        }*/
	    	var oneChar=code.charCodeAt(inx);
	    	  if ( oneChar < 0x0100 ) {
	    		  code_byte = code_byte +1;
	    	  } else {
	    		  code_byte+=2;
	    	  }
	    }
	    return code_byte;
	}
	
	function emailValid(value) {
		return /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i.test(value);
	}
	
	
	
	
	var guid = (function() {
		  function s4() {
		    return Math.floor((1 + Math.random()) * 0x10000)
		               .toString(16)
		               .substring(1);
		  }
		  return function() {
		    return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
		           s4() + '-' + s4() + s4() + s4();
		  };
		})();
	
	

	function isEmpty(mixed_var) {
		  //   example 1: empty(null);
		  //   returns 1: true
		  //   example 2: empty(undefined);
		  //   returns 2: true
		  //   example 3: empty([]);
		  //   returns 3: true
		  //   example 4: empty({});
		  //   returns 4: true
		  //   example 5: empty({'aFunc' : function () { alert('humpty'); } });
		  //   returns 5: false

		  var undef, key, i, len;
		  var emptyValues = [undef, null, false, 0, '', '0'];

		  for (i = 0, len = emptyValues.length; i < len; i++) {
		    if (mixed_var === emptyValues[i]) {
		      return true;
		    }
		  }

		  if (typeof mixed_var === 'object') {
			
			if(  $(mixed_var).attr('placeholder') ) {
				if( $(mixed_var).val() == $(mixed_var).attr('placeholder') )
					return true;
				else if( $(mixed_var).val() == '' )
					return true;
			}
			  
		    if( $(mixed_var).val() != null && $(mixed_var).val() != '' )
		    	return false;
		    else
		    	return true;
		  }

		  return false;
		}
	
	function removeLastDelimeter(src, del) {
		if( src.indexOf(del) > -1 ) {
			src = src.substring(0, src.lastIndexOf(del));
		}
		return src;
	}
	
	
	function toFormattedDate(date) {
		return date.getFullYear() + "/" + formatNumeric( (date.getMonth() + 1) ) + "/" + formatNumeric(date.getDate()) + " " + formatNumeric(date.getHours()) + ":" + formatNumeric(date.getMinutes());
	}
	
	function toFormattedDate2(date) {
		return date.getFullYear() + "." + formatNumeric( (date.getMonth() + 1) ) + "." + formatNumeric(date.getDate());
	}
	
	function formatNumeric(number) {
		
		if( number < 10 ) {
			return "0" + number;
		} else {
			return number;
		}
	}
	
	function monthDiff(d1, d2) {
		
	    var months;
	    months = (d2.getFullYear() - d1.getFullYear()) * 12;
	    months -= d1.getMonth() + 1;
	    months += d2.getMonth();
	    return months <= 0 ? 0 : months;
	    
	}
	
	

