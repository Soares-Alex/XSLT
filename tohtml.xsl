<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei"
    version="2.0">
    <!-- CSS is inside HTML, design/style will be destroyed if a validation is added-->
    <!-- output html -->

    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <!-- les variables utilisees pour la transformation -->
    <!-- navigation bar -->

    <xsl:variable name="home" select="concat('home', '.html')"/>
    <xsl:variable name="listPerson" select="concat('listPerson', '.html')"/>
    <xsl:variable name="listPlace" select="concat('listPlace', '.html')"/>
    <xsl:variable name="relation" select="concat('relation', '.html')"/>
    <xsl:variable name="metadata" select="concat('metadata', '.html')"/>

    <!-- main organisation -->
    <!-- 5 variables -->
    <!-- entire text -->

    <xsl:template match="/">

        <!-- *************************************************** -->
        <!-- HOME -->
        <xsl:result-document href="home.html">
            <html>
                <head>
                    <link rel="stylesheet"
                        href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
                        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
                        crossorigin="anonymous"/>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" 
                        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" 
                        crossorigin="anonymous"/>

                    <title>XML to HTML - Home</title>
                    <meta name="author" content="Alex Soares"/>
                </head>

                <!-- Sommaire -->
                <body>
                    <header>
                        <!-- Navbar -->
                        <nav class="navbar navbar-expand-lg navbar-light bg-white">
                            <div class="container-fluid">
                                <button class="navbar-toggler" type="button"
                                    data-mdb-toggle="collapse" data-mdb-target="#navbarExample01"
                                    aria-controls="navbarExample01" aria-expanded="false"
                                    aria-label="Toggle navigation">
                                    <i class="fas fa-bars"/>
                                </button>
                                <div class="collapse navbar-collapse" id="navbarExample01">
                                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                        <li class="nav-item active">
                                            <a class="nav-link" aria-current="page" href="{$home}"
                                                >Accueil</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="{$listPerson}">Personnages</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="{$listPlace}">Lieux</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="{$relation}">Relations</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="{$metadata}">Metadata</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </nav>
                        
                        <!-- Navbar's end -->
                        
                        <!-- Introduction -->
                        <div class="p-5 text bg-light">
                            <h1 class="mb-3" style="text-align:center">
                                <xsl:value-of select="/TEI//titleStmt[1]/title[@type = 'main']"/>
                            </h1>
                            <h5 class="mb-3 text-justify">
                                <xsl:value-of select="/TEI//titleStmt[1]/title[@type = 'subtitle']"/>
                             </h5>
                        </div>
                     </header>

                    <!-- Header's end -->
                    <!-- BODY -->

                    <xsl:for-each select="/TEI//div">
                        
                        <div style="text-align:justify, margin: px10 ">
                            <xsl:copy select=".">
                                <br/>
                                <h2 style="text-align:center">
                                    <xsl:value-of select="head"/>
                                </h2>
                                <xsl:for-each select="p">
                                    <p>
                                        <xsl:apply-templates/>
                                    </p>
                                </xsl:for-each>
                            </xsl:copy>
                        </div>
                            
                    </xsl:for-each>

                    <!-- footer -->

                    <footer class="bg-light text-center text-lg-start">
                        
                        <div class="container p-4">
                            <xsl:value-of
                                select="concat(/TEI/teiHeader[1]/fileDesc[1]/titleStmt[1]/respStmt[1]/resp[1], ' par Alex Soares')"/>
                        </div>
                        
                        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                            © 2021 Copyright: <a class="text-dark" href="http://www.chartes.psl.eu/"
                                >http://www.chartes.psl.eu/</a>
                        </div>
                    
                    </footer>

                    <!-- footer's end -->

                    <!-- fin -->
                </body>
            </html>

        </xsl:result-document>

        <!-- ****************************************** -->
        <!-- LISTPERSON -->

        <xsl:result-document href="listPerson.html">
            <html>
                <head>

                    <link rel="stylesheet"
                        href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
                        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
                        crossorigin="anonymous"/>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" 
                        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" 
                        crossorigin="anonymous"/>
                    <meta charset="UTF-8"/>
                    <title>XML to HTML - ListPerson</title>
                    <meta name="author" content="Alex Soares"/>
                </head>
                <!-- Sommaire -->
                
                <body>
                    <header>
                        <!-- Navbar -->
                        <nav class="navbar navbar-expand-lg navbar-light bg-white">
                            <div class="container-fluid">
                                <button class="navbar-toggler" type="button"
                                    data-mdb-toggle="collapse" data-mdb-target="#navbarExample01"
                                    aria-controls="navbarExample01" aria-expanded="false"
                                    aria-label="Toggle navigation">
                                    <i class="fas fa-bars"/>
                                </button>
                                <div class="collapse navbar-collapse" id="navbarExample01">
                                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                        <li class="nav-item active">
                                            <a class="nav-link" aria-current="page" href="{$home}"
                                                >Accueil</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="{$listPerson}">Personnages</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="{$listPlace}">Lieux</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="{$relation}">Relations</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="{$metadata}">Metadata</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </nav>
                        
                        <!-- Navbar's end -->
                        <!-- Introduction -->
                        <div class="p-5 text bg-light">
                            <h1 class="mb-3" style="text-align:center">
                                <xsl:value-of select="/TEI//titleStmt[1]/title[@type = 'main']"/>
                            </h1>
                            <h4 class="mb-3 text-justify">
                                <xsl:value-of select="/TEI//titleStmt[1]/title[@type = 'subtitle']"/>
                            </h4>
                        </div>
                    </header>                    
                    
                    <div>
                        <h3>Personnages</h3>

                        <xsl:for-each select="//TEI/standOff/listPerson/person">
                            <ul>
                                <li>
                                    <a>
                                        <xsl:value-of select="persName"/>
                                    </a>
                                </li>
                            </ul>
                        </xsl:for-each>

                    </div>

                    <!-- footer -->
                    
                    <footer class="bg-light text-center text-lg-start">
                        
                        <div class="container p-4">
                            <xsl:value-of
                                select="concat(/TEI/teiHeader[1]/fileDesc[1]/titleStmt[1]/respStmt[1]/resp[1], ' par Alex Soares')"/>
                        </div>
                        
                        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                            © 2021 Copyright: <a class="text-dark" href="http://www.chartes.psl.eu/"
                                >http://www.chartes.psl.eu/</a>
                        </div>
                        
                    </footer>
                    
                    <!-- footer's end -->
                    
                    <!-- fin -->
                </body>
            </html>

        </xsl:result-document>

        <!-- ****************************************** -->
        <!-- LISTPLACE -->

        <xsl:result-document href="listPlace.html">
            <html>
                <head>
                    <link rel="stylesheet"
                        href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
                        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
                        crossorigin="anonymous"/>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" 
                        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" 
                        crossorigin="anonymous"/>

                    <link rel="stylesheet" type="text/css" href=""/>
                    <meta charset="UTF-8"/>
                    <title>XML to HTML - ListPlace</title>
                    <meta name="author" content="Alex Soares"/>
                </head>
                <!-- Sommaire -->
                <body>
                    <header>
                        <!-- Navbar -->
                        <nav class="navbar navbar-expand-lg navbar-light bg-white">
                            <div class="container-fluid">
                                <button class="navbar-toggler" type="button"
                                    data-mdb-toggle="collapse" data-mdb-target="#navbarExample01"
                                    aria-controls="navbarExample01" aria-expanded="false"
                                    aria-label="Toggle navigation">
                                    <i class="fas fa-bars"/>
                                </button>
                                <div class="collapse navbar-collapse" id="navbarExample01">
                                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                        <li class="nav-item active">
                                            <a class="nav-link" aria-current="page" href="{$home}"
                                                >Accueil</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="{$listPerson}">Personnages</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="{$listPlace}">Lieux</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="{$relation}">Relations</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="{$metadata}">Metadata</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </nav>
                        
                        <!-- Navbar's end -->
                        <!-- Introduction -->
                        <div class="p-5 text bg-light">
                            <h1 class="mb-3" style="text-align:center">
                                <xsl:value-of select="/TEI//titleStmt[1]/title[@type = 'main']"/>
                            </h1>
                            <h4 class="mb-3 text-justify">
                                <xsl:value-of select="/TEI//titleStmt[1]/title[@type = 'subtitle']"/>
                            </h4>
                        </div>
                    </header>
                    <!-- Sommaire's end -->

                    <div>
                        <h3>Lieux</h3>

                        <xsl:for-each select="//TEI/standOff/listPlace/place">
                            <ul>
                                <li>
                                    <a>
                                        <xsl:value-of select="placeName"/>
                                    </a>
                                </li>
                            </ul>
                        </xsl:for-each>

                    </div>

                    <!-- footer -->
                    
                    <footer class="bg-light text-center text-lg-start">
                        
                        <div class="container p-4">
                            <xsl:value-of
                                select="concat(/TEI/teiHeader[1]/fileDesc[1]/titleStmt[1]/respStmt[1]/resp[1], ' par Alex Soares')"/>
                        </div>
                        
                        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                            © 2021 Copyright: <a class="text-dark" href="http://www.chartes.psl.eu/"
                                >http://www.chartes.psl.eu/</a>
                        </div>
                        
                    </footer>
                    
                    <!-- footer's end -->
                    
                    <!-- fin -->
                </body>
            </html>

        </xsl:result-document>

        <!-- *************************************** -->
        <!-- RELATION -->

        <!-- loop "for each" seems necessary here due to the data's 
           structure of the data, it can be made by un number/point, 
           it seems necessary
        -->

        <xsl:result-document href="relation.html">

            <html>
                <head>
                    <link rel="stylesheet"
                        href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
                        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
                        crossorigin="anonymous"/>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" 
                        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" 
                        crossorigin="anonymous"/>

                    <link rel="stylesheet" type="text/css" href=""/>
                    <meta charset="UTF-8"/>
                    <title>XML to HTML - Relation</title>
                    <meta name="author" content="Alex Soares"/>
                </head>
                
                    <!-- Sommaire -->
                    <body>
                        <header>
                            <!-- Navbar -->
                            <nav class="navbar navbar-expand-lg navbar-light bg-white">
                                <div class="container-fluid">
                                    <button class="navbar-toggler" type="button"
                                        data-mdb-toggle="collapse" data-mdb-target="#navbarExample01"
                                        aria-controls="navbarExample01" aria-expanded="false"
                                        aria-label="Toggle navigation">
                                        <i class="fas fa-bars"/>
                                    </button>
                                    <div class="collapse navbar-collapse" id="navbarExample01">
                                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                            <li class="nav-item active">
                                                <a class="nav-link" aria-current="page" href="{$home}"
                                                    >Accueil</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="{$listPerson}">Personnages</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="{$listPlace}">Lieux</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="{$relation}">Relations</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="{$metadata}">Metadata</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </nav>
                            
                            <!-- Navbar's end -->
                            <!-- Introduction -->
                            <div class="p-5 text bg-light">
                                <h1 class="mb-3" style="text-align:center">
                                    <xsl:value-of select="/TEI//titleStmt[1]/title[@type = 'main']"/>
                                </h1>
                                <h4 class="mb-3 text-justify">
                                    <xsl:value-of select="/TEI//titleStmt[1]/title[@type = 'subtitle']"/>
                                </h4>
                            </div>
                        </header>
                    
                    <!-- ***************************************************** -->
                    <!-- RELATIONS -->

                    <div>
                        <h3>Relations</h3>
                        <xsl:variable name="vide"></xsl:variable>

                        <xsl:for-each select="//listRelation">
                            <div> 
                                <ul> 
                                 <h4>Type de relation:
                                     <xsl:value-of select=" translate(@type,'_',' ')"/>
                                 </h4>
                                 <h6>Name:
                                     <xsl:value-of select="translate(./relation/@name, '_','  ')"/>
                                 </h6>
                                 <li>Personnage:
                                      <xsl:value-of select="translate(./relation/@passive,'#,_',' , ')"/>
                                 </li>    
                                <li>Personnage:
                                    <xsl:value-of select="translate(./relation/@active,'#,_',' , ')"/>
                                </li>
                                </ul>    
                            </div>
                        </xsl:for-each>

                    </div>

                    <!-- footer -->
                    
                    <footer class="bg-light text-center text-lg-start">
                        
                        <div class="container p-4">
                            <xsl:value-of
                                select="concat(/TEI/teiHeader[1]/fileDesc[1]/titleStmt[1]/respStmt[1]/resp[1], ' par Alex Soares')"/>
                        </div>
                        
                        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                            © 2021 Copyright: <a class="text-dark" href="http://www.chartes.psl.eu/"
                                >http://www.chartes.psl.eu/</a>
                        </div>
                        
                    </footer>
                    
                    <!-- footer's end -->
                    
                    <!-- fin -->
                </body>
            </html>

        </xsl:result-document>

        <!-- I would to like just to copy and past all information 
        which was demonstrated in XML TEi, first to save time and energy, -->

        <!-- ***************************************************** -->
        <!-- METADATA -->

        <xsl:result-document href="metadata.html">

            <html>
                <head>
                    <link rel="stylesheet"
                        href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
                        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
                        crossorigin="anonymous"/>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" 
                        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" 
                        crossorigin="anonymous"/>

                    <link rel="stylesheet" type="text/css" href=""/>
                    <meta charset="UTF-8"/>
                    <title>XML to HTML - metadata</title>
                    <meta name="author" content="Alex Soares"/>
                </head>
                <!-- Sommaire -->
                <body>
                    <header>
                        <!-- Navbar -->
                        <nav class="navbar navbar-expand-lg navbar-light bg-white">
                            <div class="container-fluid">
                                <button class="navbar-toggler" type="button"
                                    data-mdb-toggle="collapse" data-mdb-target="#navbarExample01"
                                    aria-controls="navbarExample01" aria-expanded="false"
                                    aria-label="Toggle navigation">
                                    <i class="fas fa-bars"/>
                                </button>
                                <div class="collapse navbar-collapse" id="navbarExample01">
                                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                        <li class="nav-item active">
                                            <a class="nav-link" aria-current="page" href="{$home}"
                                                >Accueil</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="{$listPerson}">Personnages</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="{$listPlace}">Lieux</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="{$relation}">Relations</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="{$metadata}">Metadata</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </nav>
                        
                        <!-- Navbar's end -->
                        <!-- Introduction -->
                        <div class="p-5 text bg-light">
                            <h1 class="mb-3" style="text-align:center">
                                <xsl:value-of select="/TEI//titleStmt[1]/title[@type = 'main']"/>
                            </h1>
                            <h4 class="mb-3 text-justify">
                                <xsl:value-of select="/TEI//titleStmt[1]/title[@type = 'subtitle']"/>
                            </h4>
                        </div>
                    </header>

                    <div>
                        <xsl:copy-of select="//publicationStmt"/>
                    </div>

                    <!-- footer -->
                    
                    <footer class="bg-light text-center text-lg-start">
                        
                        <div class="container p-4">
                            <xsl:value-of
                                select="concat(/TEI/teiHeader[1]/fileDesc[1]/titleStmt[1]/respStmt[1]/resp[1], ' par Alex Soares')"/>
                        </div>
                        
                        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                            © 2021 Copyright: <a class="text-dark" href="http://www.chartes.psl.eu/"
                                >http://www.chartes.psl.eu/</a>
                        </div>
                        
                    </footer>
                    
                    <!-- footer's end -->
                    
                    <!-- fin -->
                </body>
            </html>

        </xsl:result-document>


        <!-- end of main organisation -->
    </xsl:template>

    
    <!-- ************************************************** -->
    <!-- HYPERLINK -->
    <!-- hyperlink to menu -->
    
    <!-- hyperlink for each href place  -->
    <xsl:template match="placeName">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="$listPlace"/>
                <xsl:value-of select="@ref"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </a>
    </xsl:template>

    <!-- hyperlink to each id place  -->
    <xsl:template match="/TEI//standOFF/listPlace">
        <xsl:for-each select="//place">
            <place>
                <xsl:attribute name="id">
                    <xsl:value-of select="./[@xml:id]"/>
                </xsl:attribute>
                <xsl:value-of select="placeName"/>
            </place>
            <br/>
            <br/>
        </xsl:for-each>
    </xsl:template>

    <!-- hyperlink for each href person -->
    <xsl:template match="persName">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="$listPerson"/>
                <xsl:value-of select="@ref"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </a>
    </xsl:template>
    
</xsl:stylesheet>
