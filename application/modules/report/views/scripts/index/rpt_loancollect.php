<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
</head>

<body>
	<h2 align="center">Rpt-CustomerPayment</h2>
	<table width="100%" border="1" style="border-collapse:collapse;" bordercolor="black">
    
    	<tr bgcolor="#BBBBBB">
        	<th>N<sub>0</sub></th>
            <th>Name</th>
            <th>Branch</th>
            <th>Date</th>
            <th>Collect amount</th>
            <th>Co</th>
        </tr>
        <?php for($i=0;$i<=7;$i++){?>
        <tr align="center">
        	<td><?php echo $i+1;?></td>
            <td>chinda</td>
            <td></td>
            <td>12 04 2013</td>
            <td></td>
            <td></td>
        </tr>
        <?php }?>
        <tr align="center">
        	<td colspan="4" height="25px"></td>
            <td colspan="2"></td>
            
        </tr>
    </table>
</body>
</html>