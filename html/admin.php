<?php
session_start();

if (@$_POST["logout"]=="Log Out")
{
    unset($_SESSION["username"]);
}
?>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="styles/styles.css"/>
    <title>SubstanceWiki</title>
</head>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="scripts/livesearch.js"></script>
<script src="scripts/logout.js"></script>
<?php include('livesearch.php'); ?>
<?php include('connection.php');?>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">SubstanceWiki</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse navmenu" id="navbarTogglerDemo02">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item active">
                <a class="nav-link" href="index.php">Home<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="admin.php">Login</a>
            </li>
        </ul>
        <div class="wrapper">
            <div class="div1"><form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" onkeyup="showResult(this.value)" type="search" placeholder="Live Search">
                </form></div>
            <div class="list-group div2" id="livesearch"> </div>
        </div>
    </div>
</nav>


<?php
if (!empty($_POST['username']) || !empty($_SESSION["username"])) {
    if (!empty($_SESSION["username"])){
        $username = $_SESSION["username"];
    } else {
        $username = "\"" . $_POST['username'] . "\"";
        $password = "\"" . $_POST['password'] . "\"";
    }
    $sql = "SELECT * FROM admin WHERE username=" . $username;
    $result = $conn->query($sql);

    //Checks if username is found in the database
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $database_password = $row["password"];
        }
        //Compares user password to hashed password in database
        if (@$_SESSION["username"] == $username || password_verify($password, $database_password)){
            $_SESSION["username"] = $username;

            if (isset($_GET["delete"])){
                $sql = "DELETE FROM substances WHERE SubstanceName='" . $_GET["delete"] . "'";
                if ($conn->query($sql) === true){
                    echo '<script type="text/javascript">',
                    'alert("Substance deleted!");',
                    '</script>';
                }
            }

            if (isset($_GET["substance"])){
                $sql = "SELECT * FROM substances WHERE SubstanceName = " . "\"" .$_GET["substance"] . "\"";
                $result = $conn->query($sql);
                while($row = mysqli_fetch_array($result)) {
                    $name = $row["SubstanceName"];
                    $description = $row["SubstanceDescription"];
                    $pharmacology = $row["SubstancePharm"];
                    $chemistry = $row["SubstanceChemistry"];
                    $lowdose = $row["LowDoseRange"];
                    $mediumdose = $row["MediumDoseRange"];
                    $highdose = $row["HighDoseRange"];
                    $image = $row["StructureImageName"];
                    $effects = $row["Effects"];
                }} else {
                unset($name);
                $description = "";
                $pharmacology = "";
                $chemistry = "";
                $lowdose = "";
                $mediumdose = "";
                $highdose = "";
                $image = "";
                $effects = "";

            }
                ?>
            <div class="alert alert-info" role="alert">
                Substance will be added if it is not present in the database. If the name is present in the database, the entry will be overwritten with the
                new data from the form. The effects field must be filled with the appropriate Effect IDs, separated by commas with no spaces.
            </div>
            <div class="container-fluid">
                <div class="row">
                <div class="col-lg-6">
                    <form action="update.php" method="POST" enctype="multipart/form-data">
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Name</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="name" value="<?php echo @$name; ?>" placeholder="Substance Name">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Description</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" name="description" placeholder="Description" rows="4"><?php echo @$description; ?></textarea>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Pharmacology</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" name="pharmacology" placeholder="Pharmacology" rows="4"><?php echo @$pharmacology; ?></textarea>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Chemistry</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" name="chemistry" placeholder="Chemistry" rows="4"><?php echo @$chemistry; ?></textarea>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Low Dose Range</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="lowdose" value="<?php echo @$lowdose; ?>" placeholder="Low Dose Range">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Mid Dose Range</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="middose" value="<?php echo @$mediumdose; ?>" placeholder="Mid Dose Range">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">High Dose Range</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="highdose" value="<?php echo @$highdose; ?>"placeholder="High Dose Range">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Structure Image Name</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="image" value="<?php echo @$image; ?>"placeholder="Structure Image Name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label >Structure Image</label>
                            <input type="file" name="fileToUpload" class="form-control-file" >
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Effects</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="effects" value="<?php echo $effects; ?>" placeholder="Effects">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                    </form>
                    
                    <form action="admin.php" method="post" style="display: inline;">
                        <input type="submit" class="btn btn-primary" name="logout" value="Log Out">
                    </form>
                </div>
            <div class="col-lg-6 col-sm-12 col-xs-12" style="overflow-y: scroll; height:900px;">
            <table class="table" id="effect-table">
                <thead>
                <tr>
                    <th scope="col">EffectID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Type</th>
                    <th scope="col">Description</th>
                </tr>
                </thead>
                <tbody>
                <?php
                $sql = "SELECT * FROM effects";
                $result = $conn->query($sql);
                while($row = mysqli_fetch_array($result)) {
                    echo "<tr>
                            <td>" . $row[0] . "</td>
                            <td>" . $row[1] . "</td>
                            <td>" . $row[2] . "</td>
                            <td>" . $row[3] . "</td>
                          </tr>";
                }
                ?>
                </tbody>
            </table>
            </div>
            </div>
            </div>
            <hr>
            <h3>Substances</h3>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col" class="d-none d-sm-table-cell">Description</th>
                    <th scope="col" class="d-none d-xl-table-cell">Pharmacology</th>
                    <th scope="col" class="d-none d-xl-table-cell">Chemistry</th>
                    <th scope="col" class="d-none d-sm-table-cell">Doses</th>
                    <th scope="col" class="d-none d-xl-table-cell">Image</th>
                    <th scope="col" class="d-none d-sm-table-cell">Effects</th>
                    <th scope="col">Actions</th>
                </tr>
                </thead>
                <tbody>
                <?php
                $sql = "SELECT * FROM substances";
                $result = $conn->query($sql);
                while($row = mysqli_fetch_array($result)) {
                    $effects = mb_strimwidth($row[9], 0, 15, "...");
                    echo "<tr>
                            <td>" . $row[1] . "</td>
                            <td class=\"d-none d-sm-table-cell\">" . $row[2] . "</td>
                            <td class=\"d-none d-xl-table-cell\">" . $row[3] . "</td>
                            <td class=\"d-none d-xl-table-cell\">" . $row[4] . "</td>
                            <td class=\"d-none d-sm-table-cell\">" . $row[5] . "<br>". $row[6] . "<br>". $row[7] . "</td>
                            <td class=\"d-none d-xl-table-cell\">" . $row[8] . "</td>
                            <td class=\"d-none d-sm-table-cell\">" . $effects . "</td>
                            <td> <form action='admin.php' method='GET'> 
                            <button type='submit' name='substance' value='" . $row[1] ."' class=\"btn btn-primary\">Edit</button>
                            <button type='submit' name='delete' value='" . $row[1] ."' class=\"btn btn-primary\">Delete</button></form>
                            </td>
                          </tr>";
                }
                ?>
                </tbody>
            </table>

    <?php } else { ?>
        <div class="jumbotron col-lg-6" style="margin:0 auto;">
            <h2>Login</h2>

            <div>
                <form action="admin.php" method="post">
                    <div class="form-group">
                        <label>Username</label>
                        <input name="username" type="text" class="form-control"
                               placeholder="Enter email" required>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input name="password" type="password" class="form-control"
                               placeholder="Password" required>
                    </div>
                    <div class="alert alert-danger" role="alert">
                        Username or password is incorrect!
                    </div>
                    <button type="submit" class="btn btn-outline-success btn-primary my-2 my-sm-0">
                        Submit
                    </button>
                </form>
            </div>
        </div> <?php }} else { ?>
        <div class="jumbotron col-lg-6" style="margin:0 auto;">
            <h2>Login</h2>

            <div>
                <form action="admin.php" method="post">
                    <div class="form-group">
                        <label>Username</label>
                        <input name="username" type="text" class="form-control"
                               placeholder="Enter email" required>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input name="password" type="password" class="form-control"
                               placeholder="Password" required>
                    </div>
                    <div class="alert alert-danger" role="alert">
                        Username or password is incorrect!
                    </div>
                    <button type="submit" class="btn btn-outline-success btn-primary my-2 my-sm-0">
                        Submit
                    </button>
                </form>
             </div>
        </div>
    <?php }
    $conn->close();
    } else { ?>
    <div class="jumbotron col-lg-6" style="margin:0 auto;">
        <h2>Login</h2>

        <div>
            <form action="admin.php" method="post">
                <div class="form-group">
                    <label>Username</label>
                    <input name="username" type="text" class="form-control"
                           placeholder="Enter email" required>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input name="password" type="password" class="form-control"
                           placeholder="Password" required>
                </div>

                <button type="submit" class="btn btn-outline-success btn-primary my-2 my-sm-0">
                    Submit
                </button>
            </form>
        </div>
    </div>
<?php }
?>

</body>
</html>