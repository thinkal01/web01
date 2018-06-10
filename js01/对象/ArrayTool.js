/*
需求：编写一个js文件，在js文件中自定义一个数组工具对象，
该工具对象要有一个找到最大值的方法，与找元素对应的索引值的方法。	
 */
//创建ArrayTool的对象
var tool = new ArrayTool();
function ArrayTool() {
	// 找最大值
	this.getMax = function(arr) {
		var max = arr[0];
		for ( var i = 1; i < arr.length; i++) {
			if (arr[i] > max) {
				max = arr[i];
			}
		}
		return max;
	}

	this.getMin = function(arr) {
		var min = arr[0];

		for ( var x = 1; x < arr.length; x++) {
			if (arr[x] < min)
				min = arr[x];
		}
		return min;
	}

	// 找元素的索引值
	this.searchEle = function(arr, target) {
		for ( var i = 0; i < arr.length; i++) {
			if (arr[i] == target) {
				return i;
			}
		}
		return -1;
	}

	this.binarySearch = function(arr, key) {
		var min, max, mid;

		min = 0;
		max = arr.length - 1;

		while (min <= max) {
			mid = (min + max) >> 1;

			if (key > arr[mid])
				min = mid + 1;
			else if (key < arr[mid])
				max = mid - 1;
			else
				return mid;
		}
		return -1;
	}

	this.binarySearch = halfSearch;
	// 折半查找，必须是对有序的数组。
	function halfSearch(arr, key) {
		...
	}
}

// 给字符串string对象添加新功能。
// 去除字符串两端的空格。
String.prototype.trim = function()
{
	var start,end;
	start = 0;
	end = this.length-1;
	
	while(start<=end && this.charAt(start)==" ")
		start++;
		
	while(start<=end && this.charAt(end)==' ')
		end--;
		
	return this.substring(start,end+1);
}

// 将字符串变成数组。
String.prototype.toCharArray = function()
{
	var arr = new Array(this.length);
	
	for(var x=0; x<this.length; x++)
	{
		arr[x] = this.charAt(x);	
	}
	
	return arr;
}

// 将字符串进行反转。
String.prototype.reverseString = function()
{
	var arr = this.toCharArray();	
	
	return arr.reverse().join("");
}
