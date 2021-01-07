require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmMain()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", rawget(obj, "setNodeObject"));

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setName("frmMain");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.Nefertyne.TheMaze");
    obj:setTitle("Ficha The Maze");
    obj:setAlign("client");
    obj:setTheme("dark");


        local function isNewVersion(installed, downloaded)
            local installedVersion = {};
            local installedIndex = 0;
            for i in string.gmatch(installed, "[^%.]+") do
                installedIndex = installedIndex +1;
                installedVersion[installedIndex] = i;
            end

            local downloadedVersion = {};
            local downloadedIndex = 0;
            for i in string.gmatch(downloaded, "[^%.]+") do
                downloadedIndex = downloadedIndex +1;
                downloadedVersion[downloadedIndex] = i;
            end

            for i=1, math.min(installedIndex, downloadedIndex), 1 do 
                if (tonumber(installedVersion[i]) or 0) > (tonumber(downloadedVersion[i]) or 0) then
                    return false;
                elseif (tonumber(installedVersion[i]) or 0) < (tonumber(downloadedVersion[i]) or 0) then
                    return true;
                end;
            end;

            if downloadedIndex > installedIndex then
                return true;
            else
                return false;
            end;
        end;
        


    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Status Básicos");
    obj.tab1:setName("tab1");

    obj.frmBase = GUI.fromHandle(_obj_newObject("form"));
    obj.frmBase:setParent(obj.tab1);
    obj.frmBase:setName("frmBase");
    obj.frmBase:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmBase);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(600);
    obj.rectangle1:setHeight(60);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setTop(5);
    obj.label1:setWidth(75);
    obj.label1:setHeight(25);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setText("Nome");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setLeft(80);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(150);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setLeft(5);
    obj.label2:setTop(30);
    obj.label2:setWidth(75);
    obj.label2:setHeight(25);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setText("Aptidão");
    obj.label2:setName("label2");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle1);
    obj.comboBox1:setLeft(80);
    obj.comboBox1:setTop(30);
    obj.comboBox1:setWidth(150);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("aptidao");
    obj.comboBox1:setItems({'Alquimista', 'Arcanista', 'Caçador', 'Bestial', 'Cavaleiro', 'Monge', 'Necromante', 'Xamã', 'Atirador', 'Cigano', 'Hoplita', 'Shinobi', 'Executor', 'Invocador', 'Paladino'});
    obj.comboBox1:setValues({'1', '2', '3', '13', '4', '5', '6', '7', '8', '9', '10', '11', '12', '14', '15'});
    obj.comboBox1:setName("comboBox1");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setLeft(225);
    obj.label3:setTop(5);
    obj.label3:setWidth(75);
    obj.label3:setHeight(25);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setText("Nível");
    obj.label3:setName("label3");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setLeft(300);
    obj.rectangle2:setTop(5);
    obj.rectangle2:setWidth(50);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle1);
    obj.label4:setLeft(300);
    obj.label4:setTop(5);
    obj.label4:setWidth(50);
    obj.label4:setHeight(25);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setField("nivel");
    obj.label4:setName("label4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle1);
    obj.label5:setLeft(225);
    obj.label5:setTop(30);
    obj.label5:setWidth(75);
    obj.label5:setHeight(25);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setText("Rank");
    obj.label5:setName("label5");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.rectangle1);
    obj.rectangle3:setLeft(300);
    obj.rectangle3:setTop(30);
    obj.rectangle3:setWidth(50);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle1);
    obj.label6:setLeft(300);
    obj.label6:setTop(30);
    obj.label6:setWidth(50);
    obj.label6:setHeight(25);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setField("rank");
    obj.label6:setName("label6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle1);
    obj.label7:setLeft(345);
    obj.label7:setTop(5);
    obj.label7:setWidth(100);
    obj.label7:setHeight(25);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setText("Experiência");
    obj.label7:setName("label7");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setLeft(440);
    obj.edit2:setTop(5);
    obj.edit2:setWidth(50);
    obj.edit2:setHeight(25);
    obj.edit2:setField("experiencia");
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle1);
    obj.label8:setLeft(345);
    obj.label8:setTop(30);
    obj.label8:setWidth(100);
    obj.label8:setHeight(25);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setText("Prestígio");
    obj.label8:setName("label8");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setLeft(440);
    obj.edit3:setTop(30);
    obj.edit3:setWidth(50);
    obj.edit3:setHeight(25);
    obj.edit3:setField("progresso");
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle1);
    obj.label9:setLeft(480);
    obj.label9:setTop(5);
    obj.label9:setWidth(75);
    obj.label9:setHeight(25);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setText("Mergo");
    obj.label9:setName("label9");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle1);
    obj.edit4:setLeft(545);
    obj.edit4:setTop(5);
    obj.edit4:setWidth(50);
    obj.edit4:setHeight(25);
    obj.edit4:setField("mergo");
    obj.edit4:setName("edit4");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle1);
    obj.label10:setLeft(480);
    obj.label10:setTop(30);
    obj.label10:setWidth(75);
    obj.label10:setHeight(25);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setText("Aruman");
    obj.label10:setName("label10");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle1);
    obj.edit5:setLeft(545);
    obj.edit5:setTop(30);
    obj.edit5:setWidth(50);
    obj.edit5:setHeight(25);
    obj.edit5:setField("pecas");
    obj.edit5:setName("edit5");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle1);
    obj.dataLink1:setField("nivel");
    obj.dataLink1:setName("dataLink1");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.scrollBox1);
    obj.rectangle4:setLeft(605);
    obj.rectangle4:setTop(0);
    obj.rectangle4:setWidth(305);
    obj.rectangle4:setHeight(305);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(606);
    obj.image1:setTop(1);
    obj.image1:setWidth(303);
    obj.image1:setHeight(303);
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.scrollBox1);
    obj.rectangle5:setLeft(0);
    obj.rectangle5:setTop(65);
    obj.rectangle5:setWidth(285);
    obj.rectangle5:setHeight(240);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle5);
    obj.label11:setLeft(0);
    obj.label11:setTop(5);
    obj.label11:setWidth(285);
    obj.label11:setHeight(25);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setText("Atributos Básicos");
    obj.label11:setName("label11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle5);
    obj.label12:setLeft(75);
    obj.label12:setTop(30);
    obj.label12:setWidth(50);
    obj.label12:setHeight(25);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setText("Natural");
    obj.label12:setFontSize(11);
    obj.label12:setName("label12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle5);
    obj.label13:setLeft(125);
    obj.label13:setTop(30);
    obj.label13:setWidth(50);
    obj.label13:setHeight(25);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setText("Adicional");
    obj.label13:setFontSize(11);
    obj.label13:setName("label13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle5);
    obj.label14:setLeft(175);
    obj.label14:setTop(30);
    obj.label14:setWidth(50);
    obj.label14:setHeight(25);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setText("Total");
    obj.label14:setFontSize(11);
    obj.label14:setName("label14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectangle5);
    obj.label15:setLeft(225);
    obj.label15:setTop(30);
    obj.label15:setWidth(50);
    obj.label15:setHeight(25);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setText("Perícia");
    obj.label15:setFontSize(11);
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangle5);
    obj.label16:setLeft(0);
    obj.label16:setTop(55);
    obj.label16:setWidth(75);
    obj.label16:setHeight(25);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setText("Agilidade");
    obj.label16:setFontSize(13);
    obj.label16:setName("label16");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle5);
    obj.edit6:setLeft(75);
    obj.edit6:setTop(55);
    obj.edit6:setWidth(50);
    obj.edit6:setHeight(25);
    obj.edit6:setField("agilidade_nivel");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setType("number");
    obj.edit6:setName("edit6");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle5);
    obj.edit7:setLeft(125);
    obj.edit7:setTop(55);
    obj.edit7:setWidth(50);
    obj.edit7:setHeight(25);
    obj.edit7:setField("agilidade_outros");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setType("number");
    obj.edit7:setName("edit7");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.rectangle5);
    obj.rectangle6:setLeft(175);
    obj.rectangle6:setTop(55);
    obj.rectangle6:setWidth(50);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.rectangle5);
    obj.label17:setLeft(175);
    obj.label17:setTop(55);
    obj.label17:setWidth(50);
    obj.label17:setHeight(25);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setField("agilidade_total");
    obj.label17:setName("label17");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.rectangle5);
    obj.rectangle7:setLeft(225);
    obj.rectangle7:setTop(55);
    obj.rectangle7:setWidth(50);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.rectangle5);
    obj.label18:setLeft(225);
    obj.label18:setTop(55);
    obj.label18:setWidth(50);
    obj.label18:setHeight(25);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setField("agilidade_pericia");
    obj.label18:setName("label18");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectangle5);
    obj.dataLink2:setFields({'agilidade_nivel', 'agilidade_outros'});
    obj.dataLink2:setName("dataLink2");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.rectangle5);
    obj.label19:setLeft(0);
    obj.label19:setTop(80);
    obj.label19:setWidth(75);
    obj.label19:setHeight(25);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setText("Constituição");
    obj.label19:setFontSize(11);
    obj.label19:setName("label19");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle5);
    obj.edit8:setLeft(75);
    obj.edit8:setTop(80);
    obj.edit8:setWidth(50);
    obj.edit8:setHeight(25);
    obj.edit8:setField("cac_nivel");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setType("number");
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle5);
    obj.edit9:setLeft(125);
    obj.edit9:setTop(80);
    obj.edit9:setWidth(50);
    obj.edit9:setHeight(25);
    obj.edit9:setField("cac_outros");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setType("number");
    obj.edit9:setName("edit9");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.rectangle5);
    obj.rectangle8:setLeft(175);
    obj.rectangle8:setTop(80);
    obj.rectangle8:setWidth(50);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.rectangle5);
    obj.label20:setLeft(175);
    obj.label20:setTop(80);
    obj.label20:setWidth(50);
    obj.label20:setHeight(25);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setField("cac_total");
    obj.label20:setName("label20");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.rectangle5);
    obj.rectangle9:setLeft(225);
    obj.rectangle9:setTop(80);
    obj.rectangle9:setWidth(50);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.rectangle5);
    obj.label21:setLeft(225);
    obj.label21:setTop(80);
    obj.label21:setWidth(50);
    obj.label21:setHeight(25);
    obj.label21:setHorzTextAlign("center");
    obj.label21:setField("cac_pericia");
    obj.label21:setName("label21");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.rectangle5);
    obj.dataLink3:setFields({'cac_nivel', 'cac_outros'});
    obj.dataLink3:setName("dataLink3");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.rectangle5);
    obj.label22:setLeft(0);
    obj.label22:setTop(105);
    obj.label22:setWidth(75);
    obj.label22:setHeight(25);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setText("Destreza");
    obj.label22:setFontSize(13);
    obj.label22:setName("label22");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle5);
    obj.edit10:setLeft(75);
    obj.edit10:setTop(105);
    obj.edit10:setWidth(50);
    obj.edit10:setHeight(25);
    obj.edit10:setField("manuseio_nivel");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setType("number");
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle5);
    obj.edit11:setLeft(125);
    obj.edit11:setTop(105);
    obj.edit11:setWidth(50);
    obj.edit11:setHeight(25);
    obj.edit11:setField("manuseio_outros");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setType("number");
    obj.edit11:setName("edit11");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.rectangle5);
    obj.rectangle10:setLeft(175);
    obj.rectangle10:setTop(105);
    obj.rectangle10:setWidth(50);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.rectangle5);
    obj.label23:setLeft(175);
    obj.label23:setTop(105);
    obj.label23:setWidth(50);
    obj.label23:setHeight(25);
    obj.label23:setHorzTextAlign("center");
    obj.label23:setField("manuseio_total");
    obj.label23:setName("label23");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.rectangle5);
    obj.rectangle11:setLeft(225);
    obj.rectangle11:setTop(105);
    obj.rectangle11:setWidth(50);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.rectangle5);
    obj.label24:setLeft(225);
    obj.label24:setTop(105);
    obj.label24:setWidth(50);
    obj.label24:setHeight(25);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setField("manuseio_pericia");
    obj.label24:setName("label24");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.rectangle5);
    obj.dataLink4:setFields({'manuseio_nivel', 'manuseio_outros'});
    obj.dataLink4:setName("dataLink4");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.rectangle5);
    obj.label25:setLeft(0);
    obj.label25:setTop(130);
    obj.label25:setWidth(75);
    obj.label25:setHeight(25);
    obj.label25:setHorzTextAlign("center");
    obj.label25:setText("Foco");
    obj.label25:setFontSize(13);
    obj.label25:setName("label25");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectangle5);
    obj.edit12:setLeft(75);
    obj.edit12:setTop(130);
    obj.edit12:setWidth(50);
    obj.edit12:setHeight(25);
    obj.edit12:setField("pontaria_nivel");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setType("number");
    obj.edit12:setName("edit12");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.rectangle5);
    obj.edit13:setLeft(125);
    obj.edit13:setTop(130);
    obj.edit13:setWidth(50);
    obj.edit13:setHeight(25);
    obj.edit13:setField("pontaria_outros");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setType("number");
    obj.edit13:setName("edit13");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.rectangle5);
    obj.rectangle12:setLeft(175);
    obj.rectangle12:setTop(130);
    obj.rectangle12:setWidth(50);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.rectangle5);
    obj.label26:setLeft(175);
    obj.label26:setTop(130);
    obj.label26:setWidth(50);
    obj.label26:setHeight(25);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setField("pontaria_total");
    obj.label26:setName("label26");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.rectangle5);
    obj.rectangle13:setLeft(225);
    obj.rectangle13:setTop(130);
    obj.rectangle13:setWidth(50);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.rectangle5);
    obj.label27:setLeft(225);
    obj.label27:setTop(130);
    obj.label27:setWidth(50);
    obj.label27:setHeight(25);
    obj.label27:setHorzTextAlign("center");
    obj.label27:setField("pontaria_pericia");
    obj.label27:setName("label27");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.rectangle5);
    obj.dataLink5:setFields({'pontaria_nivel', 'pontaria_outros'});
    obj.dataLink5:setName("dataLink5");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.rectangle5);
    obj.label28:setLeft(0);
    obj.label28:setTop(155);
    obj.label28:setWidth(75);
    obj.label28:setHeight(25);
    obj.label28:setHorzTextAlign("center");
    obj.label28:setText("Reverberação");
    obj.label28:setFontSize(11);
    obj.label28:setName("label28");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.rectangle5);
    obj.edit14:setLeft(75);
    obj.edit14:setTop(155);
    obj.edit14:setWidth(50);
    obj.edit14:setHeight(25);
    obj.edit14:setField("paranormalidade_nivel");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setType("number");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.rectangle5);
    obj.edit15:setLeft(125);
    obj.edit15:setTop(155);
    obj.edit15:setWidth(50);
    obj.edit15:setHeight(25);
    obj.edit15:setField("paranormalidade_outros");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setType("number");
    obj.edit15:setName("edit15");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.rectangle5);
    obj.rectangle14:setLeft(175);
    obj.rectangle14:setTop(155);
    obj.rectangle14:setWidth(50);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.rectangle5);
    obj.label29:setLeft(175);
    obj.label29:setTop(155);
    obj.label29:setWidth(50);
    obj.label29:setHeight(25);
    obj.label29:setHorzTextAlign("center");
    obj.label29:setField("paranormalidade_total");
    obj.label29:setName("label29");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.rectangle5);
    obj.rectangle15:setLeft(225);
    obj.rectangle15:setTop(155);
    obj.rectangle15:setWidth(50);
    obj.rectangle15:setHeight(25);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.rectangle5);
    obj.label30:setLeft(225);
    obj.label30:setTop(155);
    obj.label30:setWidth(50);
    obj.label30:setHeight(25);
    obj.label30:setHorzTextAlign("center");
    obj.label30:setField("paranormalidade_pericia");
    obj.label30:setName("label30");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.rectangle5);
    obj.dataLink6:setFields({'paranormalidade_nivel', 'paranormalidade_outros'});
    obj.dataLink6:setName("dataLink6");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.rectangle5);
    obj.label31:setLeft(0);
    obj.label31:setTop(180);
    obj.label31:setWidth(75);
    obj.label31:setHeight(25);
    obj.label31:setHorzTextAlign("center");
    obj.label31:setText("Sorte");
    obj.label31:setFontSize(13);
    obj.label31:setName("label31");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.rectangle5);
    obj.edit16:setLeft(75);
    obj.edit16:setTop(180);
    obj.edit16:setWidth(50);
    obj.edit16:setHeight(25);
    obj.edit16:setField("sorte_nivel");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setType("number");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.rectangle5);
    obj.edit17:setLeft(125);
    obj.edit17:setTop(180);
    obj.edit17:setWidth(50);
    obj.edit17:setHeight(25);
    obj.edit17:setField("sorte_outros");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setType("number");
    obj.edit17:setName("edit17");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.rectangle5);
    obj.rectangle16:setLeft(175);
    obj.rectangle16:setTop(180);
    obj.rectangle16:setWidth(50);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.rectangle5);
    obj.label32:setLeft(175);
    obj.label32:setTop(180);
    obj.label32:setWidth(50);
    obj.label32:setHeight(25);
    obj.label32:setHorzTextAlign("center");
    obj.label32:setField("sorte_total");
    obj.label32:setName("label32");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.rectangle5);
    obj.rectangle17:setLeft(225);
    obj.rectangle17:setTop(180);
    obj.rectangle17:setWidth(50);
    obj.rectangle17:setHeight(25);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.rectangle5);
    obj.label33:setLeft(225);
    obj.label33:setTop(180);
    obj.label33:setWidth(50);
    obj.label33:setHeight(25);
    obj.label33:setHorzTextAlign("center");
    obj.label33:setField("sorte_pericia");
    obj.label33:setName("label33");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.rectangle5);
    obj.dataLink7:setFields({'sorte_nivel', 'sorte_outros'});
    obj.dataLink7:setName("dataLink7");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.rectangle5);
    obj.rectangle18:setLeft(15);
    obj.rectangle18:setTop(210);
    obj.rectangle18:setWidth(50);
    obj.rectangle18:setHeight(25);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.atr_max = GUI.fromHandle(_obj_newObject("label"));
    obj.atr_max:setParent(obj.rectangle5);
    obj.atr_max:setLeft(15);
    obj.atr_max:setTop(210);
    obj.atr_max:setWidth(50);
    obj.atr_max:setHeight(25);
    obj.atr_max:setHorzTextAlign("center");
    obj.atr_max:setField("atr_max");
    obj.atr_max:setName("atr_max");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.rectangle5);
    obj.rectangle19:setLeft(75);
    obj.rectangle19:setTop(210);
    obj.rectangle19:setWidth(50);
    obj.rectangle19:setHeight(25);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.rectangle5);
    obj.label34:setLeft(75);
    obj.label34:setTop(210);
    obj.label34:setWidth(50);
    obj.label34:setHeight(25);
    obj.label34:setHorzTextAlign("center");
    obj.label34:setField("sum_nivel");
    obj.label34:setName("label34");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.rectangle5);
    obj.dataLink8:setFields({'atr_max','sum_nivel'});
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.rectangle5);
    obj.dataLink9:setFields({'agilidade_nivel', 'cac_nivel', 'manuseio_nivel', 'pontaria_nivel', 'paranormalidade_nivel', 'sorte_nivel'});
    obj.dataLink9:setName("dataLink9");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(290);
    obj.layout1:setTop(65);
    obj.layout1:setWidth(310);
    obj.layout1:setHeight(240);
    obj.layout1:setName("layout1");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout1);
    obj.rectangle20:setAlign("client");
    obj.rectangle20:setColor("black");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout1);
    obj.label35:setLeft(5);
    obj.label35:setTop(1);
    obj.label35:setWidth(300);
    obj.label35:setHeight(20);
    obj.label35:setText("Características");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout1);
    obj.label36:setLeft(5);
    obj.label36:setTop(25);
    obj.label36:setWidth(110);
    obj.label36:setHeight(20);
    obj.label36:setText("Carisma/Charme");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout1);
    obj.edit18:setLeft(115);
    obj.edit18:setTop(25);
    obj.edit18:setWidth(30);
    obj.edit18:setHeight(25);
    obj.edit18:setField("carac_p_1");
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setType("number");
    obj.edit18:setName("edit18");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout1);
    obj.label37:setLeft(185);
    obj.label37:setTop(25);
    obj.label37:setWidth(110);
    obj.label37:setHeight(20);
    obj.label37:setText("Emotividade");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout1);
    obj.edit19:setLeft(155);
    obj.edit19:setTop(25);
    obj.edit19:setWidth(30);
    obj.edit19:setHeight(25);
    obj.edit19:setField("carac_n_1");
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setType("number");
    obj.edit19:setName("edit19");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout1);
    obj.label38:setLeft(5);
    obj.label38:setTop(50);
    obj.label38:setWidth(110);
    obj.label38:setHeight(20);
    obj.label38:setText("Força de Vontade");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout1);
    obj.edit20:setLeft(115);
    obj.edit20:setTop(50);
    obj.edit20:setWidth(30);
    obj.edit20:setHeight(25);
    obj.edit20:setField("carac_p_2");
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setType("number");
    obj.edit20:setName("edit20");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout1);
    obj.label39:setLeft(185);
    obj.label39:setTop(50);
    obj.label39:setWidth(110);
    obj.label39:setHeight(20);
    obj.label39:setText("Trauma/Medo");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout1);
    obj.edit21:setLeft(155);
    obj.edit21:setTop(50);
    obj.edit21:setWidth(30);
    obj.edit21:setHeight(25);
    obj.edit21:setField("carac_n_2");
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setType("number");
    obj.edit21:setName("edit21");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout1);
    obj.label40:setLeft(5);
    obj.label40:setTop(75);
    obj.label40:setWidth(110);
    obj.label40:setHeight(20);
    obj.label40:setText("Intelecto");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout1);
    obj.edit22:setLeft(115);
    obj.edit22:setTop(75);
    obj.edit22:setWidth(30);
    obj.edit22:setHeight(25);
    obj.edit22:setField("carac_p_3");
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setType("number");
    obj.edit22:setName("edit22");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout1);
    obj.label41:setLeft(185);
    obj.label41:setTop(75);
    obj.label41:setWidth(110);
    obj.label41:setHeight(20);
    obj.label41:setText("Azar");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout1);
    obj.edit23:setLeft(155);
    obj.edit23:setTop(75);
    obj.edit23:setWidth(30);
    obj.edit23:setHeight(25);
    obj.edit23:setField("carac_n_3");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setType("number");
    obj.edit23:setName("edit23");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout1);
    obj.label42:setLeft(5);
    obj.label42:setTop(100);
    obj.label42:setWidth(110);
    obj.label42:setHeight(20);
    obj.label42:setText("Intuição");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout1);
    obj.edit24:setLeft(115);
    obj.edit24:setTop(100);
    obj.edit24:setWidth(30);
    obj.edit24:setHeight(25);
    obj.edit24:setField("carac_p_4");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setType("number");
    obj.edit24:setName("edit24");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout1);
    obj.label43:setLeft(185);
    obj.label43:setTop(100);
    obj.label43:setWidth(110);
    obj.label43:setHeight(20);
    obj.label43:setText("Impulsividade");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout1);
    obj.edit25:setLeft(155);
    obj.edit25:setTop(100);
    obj.edit25:setWidth(30);
    obj.edit25:setHeight(25);
    obj.edit25:setField("carac_n_4");
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setType("number");
    obj.edit25:setName("edit25");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout1);
    obj.label44:setLeft(5);
    obj.label44:setTop(125);
    obj.label44:setWidth(110);
    obj.label44:setHeight(20);
    obj.label44:setText("Intimidação");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout1);
    obj.edit26:setLeft(115);
    obj.edit26:setTop(125);
    obj.edit26:setWidth(30);
    obj.edit26:setHeight(25);
    obj.edit26:setField("carac_p_5");
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setType("number");
    obj.edit26:setName("edit26");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout1);
    obj.label45:setLeft(185);
    obj.label45:setTop(125);
    obj.label45:setWidth(110);
    obj.label45:setHeight(20);
    obj.label45:setText("Materialismo");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout1);
    obj.edit27:setLeft(155);
    obj.edit27:setTop(125);
    obj.edit27:setWidth(30);
    obj.edit27:setHeight(25);
    obj.edit27:setField("carac_n_5");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setType("number");
    obj.edit27:setName("edit27");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout1);
    obj.label46:setLeft(5);
    obj.label46:setTop(150);
    obj.label46:setWidth(110);
    obj.label46:setHeight(20);
    obj.label46:setText("Fleuma");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout1);
    obj.edit28:setLeft(115);
    obj.edit28:setTop(150);
    obj.edit28:setWidth(30);
    obj.edit28:setHeight(25);
    obj.edit28:setField("carac_p_6");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setType("number");
    obj.edit28:setName("edit28");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout1);
    obj.label47:setLeft(185);
    obj.label47:setTop(150);
    obj.label47:setWidth(110);
    obj.label47:setHeight(20);
    obj.label47:setText("Irritação/Orgulho");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setName("label47");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout1);
    obj.edit29:setLeft(155);
    obj.edit29:setTop(150);
    obj.edit29:setWidth(30);
    obj.edit29:setHeight(25);
    obj.edit29:setField("carac_n_6");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setType("number");
    obj.edit29:setName("edit29");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout1);
    obj.rectangle21:setLeft(115);
    obj.rectangle21:setTop(175);
    obj.rectangle21:setWidth(30);
    obj.rectangle21:setHeight(25);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout1);
    obj.label48:setLeft(115);
    obj.label48:setTop(175);
    obj.label48:setWidth(30);
    obj.label48:setHeight(25);
    obj.label48:setHorzTextAlign("center");
    obj.label48:setField("carac_gasto");
    obj.label48:setName("label48");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout1);
    obj.edit30:setLeft(155);
    obj.edit30:setTop(175);
    obj.edit30:setWidth(30);
    obj.edit30:setHeight(25);
    obj.edit30:setField("carac_extra");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setType("number");
    obj.edit30:setName("edit30");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout1);
    obj.rectangle22:setLeft(185);
    obj.rectangle22:setTop(175);
    obj.rectangle22:setWidth(30);
    obj.rectangle22:setHeight(25);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setName("rectangle22");

    obj.carac_total = GUI.fromHandle(_obj_newObject("label"));
    obj.carac_total:setParent(obj.layout1);
    obj.carac_total:setLeft(185);
    obj.carac_total:setTop(175);
    obj.carac_total:setWidth(30);
    obj.carac_total:setHeight(25);
    obj.carac_total:setHorzTextAlign("center");
    obj.carac_total:setField("carac_total");
    obj.carac_total:setFontColor("green");
    obj.carac_total:setName("carac_total");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout1);
    obj.label49:setLeft(45);
    obj.label49:setTop(205);
    obj.label49:setWidth(100);
    obj.label49:setHeight(25);
    obj.label49:setText("Carma");
    obj.label49:setName("label49");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout1);
    obj.comboBox2:setLeft(100);
    obj.comboBox2:setTop(205);
    obj.comboBox2:setWidth(200);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setField("carma");
    obj.comboBox2:setItems({'Divino','Virtuoso','Humano','Herege','Demoníaco'});
    obj.comboBox2:setName("comboBox2");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout1);
    obj.dataLink10:setFields({'carac_p_1','carac_p_2','carac_p_3','carac_p_4','carac_p_5','carac_p_6'});
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout1);
    obj.dataLink11:setFields({'carac_n_1','carac_n_2','carac_n_3','carac_n_4','carac_n_5','carac_n_6'});
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout1);
    obj.dataLink12:setFields({'nivel','carac_penalidade', 'carac_extra'});
    obj.dataLink12:setName("dataLink12");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout1);
    obj.dataLink13:setFields({'carac_gasto','carac_total'});
    obj.dataLink13:setName("dataLink13");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.scrollBox1);
    obj.rectangle23:setLeft(0);
    obj.rectangle23:setTop(310);
    obj.rectangle23:setWidth(285);
    obj.rectangle23:setHeight(105);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.rectangle23);
    obj.label50:setLeft(0);
    obj.label50:setTop(0);
    obj.label50:setWidth(285);
    obj.label50:setHeight(20);
    obj.label50:setHorzTextAlign("center");
    obj.label50:setText("Integridade");
    obj.label50:setName("label50");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.rectangle23);
    obj.label51:setLeft(5);
    obj.label51:setTop(25);
    obj.label51:setWidth(90);
    obj.label51:setHeight(25);
    obj.label51:setHorzTextAlign("center");
    obj.label51:setText("Vida");
    obj.label51:setName("label51");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.rectangle23);
    obj.rectangle24:setLeft(95);
    obj.rectangle24:setTop(25);
    obj.rectangle24:setWidth(50);
    obj.rectangle24:setHeight(25);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setName("rectangle24");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.rectangle23);
    obj.label52:setLeft(95);
    obj.label52:setTop(25);
    obj.label52:setWidth(50);
    obj.label52:setHeight(25);
    obj.label52:setHorzTextAlign("center");
    obj.label52:setField("vidaBase");
    obj.label52:setName("label52");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.rectangle23);
    obj.edit31:setLeft(145);
    obj.edit31:setTop(25);
    obj.edit31:setWidth(70);
    obj.edit31:setHeight(25);
    obj.edit31:setField("vidaCompensacao");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setType("number");
    obj.edit31:setName("edit31");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.rectangle23);
    obj.rectangle25:setLeft(215);
    obj.rectangle25:setTop(25);
    obj.rectangle25:setWidth(65);
    obj.rectangle25:setHeight(25);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setName("rectangle25");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.rectangle23);
    obj.label53:setLeft(215);
    obj.label53:setTop(25);
    obj.label53:setWidth(65);
    obj.label53:setHeight(25);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setField("vidaAtual");
    obj.label53:setName("label53");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.rectangle23);
    obj.dataLink14:setFields({'vidaBase','vidaCompensacao'});
    obj.dataLink14:setName("dataLink14");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.rectangle23);
    obj.label54:setLeft(5);
    obj.label54:setTop(50);
    obj.label54:setWidth(90);
    obj.label54:setHeight(25);
    obj.label54:setHorzTextAlign("center");
    obj.label54:setText("Fadiga");
    obj.label54:setName("label54");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.rectangle23);
    obj.rectangle26:setLeft(95);
    obj.rectangle26:setTop(50);
    obj.rectangle26:setWidth(50);
    obj.rectangle26:setHeight(25);
    obj.rectangle26:setColor("black");
    obj.rectangle26:setStrokeColor("white");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setName("rectangle26");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.rectangle23);
    obj.label55:setLeft(95);
    obj.label55:setTop(50);
    obj.label55:setWidth(50);
    obj.label55:setHeight(25);
    obj.label55:setHorzTextAlign("center");
    obj.label55:setField("fadigaBase");
    obj.label55:setName("label55");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.rectangle23);
    obj.edit32:setLeft(145);
    obj.edit32:setTop(50);
    obj.edit32:setWidth(70);
    obj.edit32:setHeight(25);
    obj.edit32:setField("fadigaCompensacao");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setType("number");
    obj.edit32:setName("edit32");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.rectangle23);
    obj.rectangle27:setLeft(215);
    obj.rectangle27:setTop(50);
    obj.rectangle27:setWidth(65);
    obj.rectangle27:setHeight(25);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setStrokeColor("white");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setName("rectangle27");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.rectangle23);
    obj.label56:setLeft(215);
    obj.label56:setTop(50);
    obj.label56:setWidth(65);
    obj.label56:setHeight(25);
    obj.label56:setHorzTextAlign("center");
    obj.label56:setField("fadigaAtual");
    obj.label56:setName("label56");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.rectangle23);
    obj.dataLink15:setFields({'fadigaBase','fadigaCompensacao'});
    obj.dataLink15:setName("dataLink15");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.rectangle23);
    obj.label57:setLeft(5);
    obj.label57:setTop(75);
    obj.label57:setWidth(90);
    obj.label57:setHeight(25);
    obj.label57:setHorzTextAlign("center");
    obj.label57:setText("Imersão");
    obj.label57:setName("label57");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.rectangle23);
    obj.rectangle28:setLeft(95);
    obj.rectangle28:setTop(75);
    obj.rectangle28:setWidth(50);
    obj.rectangle28:setHeight(25);
    obj.rectangle28:setColor("black");
    obj.rectangle28:setStrokeColor("white");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setName("rectangle28");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.rectangle23);
    obj.label58:setLeft(95);
    obj.label58:setTop(75);
    obj.label58:setWidth(50);
    obj.label58:setHeight(25);
    obj.label58:setHorzTextAlign("center");
    obj.label58:setField("imersaoBase");
    obj.label58:setName("label58");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.rectangle23);
    obj.edit33:setLeft(145);
    obj.edit33:setTop(75);
    obj.edit33:setWidth(70);
    obj.edit33:setHeight(25);
    obj.edit33:setField("imersaoCompensacao");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setType("number");
    obj.edit33:setName("edit33");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.rectangle23);
    obj.rectangle29:setLeft(215);
    obj.rectangle29:setTop(75);
    obj.rectangle29:setWidth(65);
    obj.rectangle29:setHeight(25);
    obj.rectangle29:setColor("black");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setName("rectangle29");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.rectangle23);
    obj.label59:setLeft(215);
    obj.label59:setTop(75);
    obj.label59:setWidth(65);
    obj.label59:setHeight(25);
    obj.label59:setHorzTextAlign("center");
    obj.label59:setField("imersaoAtual");
    obj.label59:setName("label59");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.rectangle23);
    obj.dataLink16:setFields({'imersaoBase','imersaoCompensacao'});
    obj.dataLink16:setName("dataLink16");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.scrollBox1);
    obj.rectangle30:setLeft(0);
    obj.rectangle30:setTop(420);
    obj.rectangle30:setWidth(285);
    obj.rectangle30:setHeight(260);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setName("rectangle30");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.rectangle30);
    obj.label60:setLeft(0);
    obj.label60:setTop(0);
    obj.label60:setWidth(285);
    obj.label60:setHeight(20);
    obj.label60:setHorzTextAlign("center");
    obj.label60:setText("Beneficios");
    obj.label60:setName("label60");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.rectangle30);
    obj.label61:setLeft(0);
    obj.label61:setTop(25);
    obj.label61:setWidth(75);
    obj.label61:setHeight(25);
    obj.label61:setHorzTextAlign("center");
    obj.label61:setText("Clã");
    obj.label61:setName("label61");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.rectangle30);
    obj.edit34:setLeft(75);
    obj.edit34:setTop(25);
    obj.edit34:setWidth(200);
    obj.edit34:setHeight(25);
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setField("cla");
    obj.edit34:setName("edit34");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.rectangle30);
    obj.label62:setLeft(0);
    obj.label62:setTop(50);
    obj.label62:setWidth(75);
    obj.label62:setHeight(25);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setText("Ultimato");
    obj.label62:setName("label62");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.rectangle30);
    obj.edit35:setLeft(75);
    obj.edit35:setTop(50);
    obj.edit35:setWidth(200);
    obj.edit35:setHeight(25);
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setField("ultimato");
    obj.edit35:setName("edit35");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.rectangle30);
    obj.label63:setLeft(0);
    obj.label63:setTop(75);
    obj.label63:setWidth(75);
    obj.label63:setHeight(25);
    obj.label63:setHorzTextAlign("center");
    obj.label63:setText("Sentinela");
    obj.label63:setName("label63");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.rectangle30);
    obj.edit36:setLeft(75);
    obj.edit36:setTop(75);
    obj.edit36:setWidth(200);
    obj.edit36:setHeight(25);
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setField("sentinela");
    obj.edit36:setName("edit36");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.rectangle30);
    obj.label64:setLeft(0);
    obj.label64:setTop(100);
    obj.label64:setWidth(75);
    obj.label64:setHeight(25);
    obj.label64:setHorzTextAlign("center");
    obj.label64:setText("Bençãos");
    obj.label64:setName("label64");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle30);
    obj.textEditor1:setLeft(75);
    obj.textEditor1:setTop(100);
    obj.textEditor1:setWidth(200);
    obj.textEditor1:setHeight(155);
    obj.textEditor1:setField("bencaos_feiticos");
    obj.textEditor1:setName("textEditor1");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.scrollBox1);
    obj.rectangle31:setLeft(290);
    obj.rectangle31:setTop(310);
    obj.rectangle31:setWidth(620);
    obj.rectangle31:setHeight(370);
    obj.rectangle31:setColor("black");
    obj.rectangle31:setStrokeColor("white");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setName("rectangle31");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.rectangle31);
    obj.label65:setAlign("top");
    obj.label65:setHeight(20);
    obj.label65:setHorzTextAlign("center");
    obj.label65:setText("Tabela de Status de Combate");
    obj.label65:setName("label65");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle31);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(310);
    obj.layout2:setName("layout2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(20);
    obj.layout3:setName("layout3");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout3);
    obj.label66:setWidth(310);
    obj.label66:setHorzTextAlign("center");
    obj.label66:setText("Poderes");
    obj.label66:setName("label66");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout3);
    obj.label67:setLeft(230);
    obj.label67:setWidth(37.5);
    obj.label67:setHeight(20);
    obj.label67:setHorzTextAlign("center");
    obj.label67:setText("Pri");
    obj.label67:setName("label67");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout3);
    obj.label68:setLeft(267.5);
    obj.label68:setWidth(37.5);
    obj.label68:setHeight(20);
    obj.label68:setHorzTextAlign("center");
    obj.label68:setText("Sec");
    obj.label68:setName("label68");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout2);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout4);
    obj.label69:setLeft(5);
    obj.label69:setWidth(100);
    obj.label69:setHeight(25);
    obj.label69:setHorzTextAlign("center");
    obj.label69:setText("Poder Físico");
    obj.label69:setFontSize(13);
    obj.label69:setName("label69");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout4);
    obj.rectangle32:setLeft(105);
    obj.rectangle32:setWidth(50);
    obj.rectangle32:setHeight(25);
    obj.rectangle32:setColor("black");
    obj.rectangle32:setStrokeColor("white");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setName("rectangle32");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout4);
    obj.label70:setLeft(105);
    obj.label70:setWidth(50);
    obj.label70:setHeight(25);
    obj.label70:setHorzTextAlign("center");
    obj.label70:setField("poderFisicoBase");
    obj.label70:setName("label70");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout4);
    obj.edit37:setLeft(155);
    obj.edit37:setWidth(37.5);
    obj.edit37:setHeight(25);
    obj.edit37:setField("poderFisicoAdicional1");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setType("number");
    obj.edit37:setName("edit37");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout4);
    obj.edit38:setLeft(192.5);
    obj.edit38:setWidth(37.5);
    obj.edit38:setHeight(25);
    obj.edit38:setField("poderFisicoAdicional2");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setType("number");
    obj.edit38:setName("edit38");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout4);
    obj.rectangle33:setLeft(230);
    obj.rectangle33:setWidth(37.5);
    obj.rectangle33:setHeight(25);
    obj.rectangle33:setColor("black");
    obj.rectangle33:setStrokeColor("white");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setName("rectangle33");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout4);
    obj.label71:setLeft(230);
    obj.label71:setWidth(37.5);
    obj.label71:setHeight(25);
    obj.label71:setHorzTextAlign("center");
    obj.label71:setField("poderFisicoTotal1");
    obj.label71:setName("label71");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout4);
    obj.rectangle34:setLeft(267.5);
    obj.rectangle34:setWidth(37.5);
    obj.rectangle34:setHeight(25);
    obj.rectangle34:setColor("black");
    obj.rectangle34:setStrokeColor("white");
    obj.rectangle34:setStrokeSize(1);
    obj.rectangle34:setName("rectangle34");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout4);
    obj.label72:setLeft(267.5);
    obj.label72:setWidth(37.5);
    obj.label72:setHeight(25);
    obj.label72:setHorzTextAlign("center");
    obj.label72:setField("poderFisicoTotal2");
    obj.label72:setName("label72");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout2);
    obj.dataLink17:setFields({'poderFisicoBase','poderFisicoAdicional1','poderFisicoBase2','poderFisicoAdicional2'});
    obj.dataLink17:setName("dataLink17");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout2);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout5);
    obj.label73:setLeft(5);
    obj.label73:setWidth(100);
    obj.label73:setHeight(25);
    obj.label73:setHorzTextAlign("center");
    obj.label73:setText("Poder Paranormal");
    obj.label73:setFontSize(11);
    obj.label73:setName("label73");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout5);
    obj.rectangle35:setLeft(105);
    obj.rectangle35:setWidth(50);
    obj.rectangle35:setHeight(25);
    obj.rectangle35:setColor("black");
    obj.rectangle35:setStrokeColor("white");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setName("rectangle35");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout5);
    obj.label74:setLeft(105);
    obj.label74:setWidth(50);
    obj.label74:setHeight(25);
    obj.label74:setHorzTextAlign("center");
    obj.label74:setField("poderParanormalBase");
    obj.label74:setName("label74");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout5);
    obj.edit39:setLeft(155);
    obj.edit39:setWidth(37.5);
    obj.edit39:setHeight(25);
    obj.edit39:setField("poderParanormalAdicional1");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setType("number");
    obj.edit39:setName("edit39");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout5);
    obj.edit40:setLeft(192.5);
    obj.edit40:setWidth(37.5);
    obj.edit40:setHeight(25);
    obj.edit40:setField("poderParanormalAdicional2");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setType("number");
    obj.edit40:setName("edit40");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout5);
    obj.rectangle36:setLeft(230);
    obj.rectangle36:setWidth(37.5);
    obj.rectangle36:setHeight(25);
    obj.rectangle36:setColor("black");
    obj.rectangle36:setStrokeColor("white");
    obj.rectangle36:setStrokeSize(1);
    obj.rectangle36:setName("rectangle36");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout5);
    obj.label75:setLeft(230);
    obj.label75:setWidth(37.5);
    obj.label75:setHeight(25);
    obj.label75:setHorzTextAlign("center");
    obj.label75:setField("poderParanormalTotal1");
    obj.label75:setName("label75");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout5);
    obj.rectangle37:setLeft(267.5);
    obj.rectangle37:setWidth(37.5);
    obj.rectangle37:setHeight(25);
    obj.rectangle37:setColor("black");
    obj.rectangle37:setStrokeColor("white");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setName("rectangle37");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout5);
    obj.label76:setLeft(267.5);
    obj.label76:setWidth(37.5);
    obj.label76:setHeight(25);
    obj.label76:setHorzTextAlign("center");
    obj.label76:setField("poderParanormalTotal2");
    obj.label76:setName("label76");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout2);
    obj.dataLink18:setFields({'poderParanormalBase','poderParanormalAdicional1','poderParanormalBase2','poderParanormalAdicional2'});
    obj.dataLink18:setName("dataLink18");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout2);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout6);
    obj.label77:setLeft(5);
    obj.label77:setWidth(100);
    obj.label77:setHeight(25);
    obj.label77:setHorzTextAlign("center");
    obj.label77:setText("Poder de Projétil");
    obj.label77:setFontSize(11);
    obj.label77:setName("label77");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout6);
    obj.rectangle38:setLeft(105);
    obj.rectangle38:setWidth(50);
    obj.rectangle38:setHeight(25);
    obj.rectangle38:setColor("black");
    obj.rectangle38:setStrokeColor("white");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setName("rectangle38");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout6);
    obj.label78:setLeft(105);
    obj.label78:setWidth(50);
    obj.label78:setHeight(25);
    obj.label78:setHorzTextAlign("center");
    obj.label78:setField("poderProjetilBase");
    obj.label78:setName("label78");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout6);
    obj.edit41:setLeft(155);
    obj.edit41:setWidth(37.5);
    obj.edit41:setHeight(25);
    obj.edit41:setField("poderProjetilAdicional1");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setType("number");
    obj.edit41:setName("edit41");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout6);
    obj.edit42:setLeft(192.5);
    obj.edit42:setWidth(37.5);
    obj.edit42:setHeight(25);
    obj.edit42:setField("poderProjetilAdicional2");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setType("number");
    obj.edit42:setName("edit42");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout6);
    obj.rectangle39:setLeft(230);
    obj.rectangle39:setWidth(37.5);
    obj.rectangle39:setHeight(25);
    obj.rectangle39:setColor("black");
    obj.rectangle39:setStrokeColor("white");
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setName("rectangle39");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout6);
    obj.label79:setLeft(230);
    obj.label79:setWidth(37.5);
    obj.label79:setHeight(25);
    obj.label79:setHorzTextAlign("center");
    obj.label79:setField("poderProjetilTotal1");
    obj.label79:setName("label79");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout6);
    obj.rectangle40:setLeft(267.5);
    obj.rectangle40:setWidth(37.5);
    obj.rectangle40:setHeight(25);
    obj.rectangle40:setColor("black");
    obj.rectangle40:setStrokeColor("white");
    obj.rectangle40:setStrokeSize(1);
    obj.rectangle40:setName("rectangle40");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout6);
    obj.label80:setLeft(267.5);
    obj.label80:setWidth(37.5);
    obj.label80:setHeight(25);
    obj.label80:setHorzTextAlign("center");
    obj.label80:setField("poderProjetilTotal2");
    obj.label80:setName("label80");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout2);
    obj.dataLink19:setFields({'poderProjetilBase','poderProjetilAdicional1','poderProjetilBase2','poderProjetilAdicional2'});
    obj.dataLink19:setName("dataLink19");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout2);
    obj.label81:setAlign("top");
    obj.label81:setHeight(20);
    obj.label81:setHorzTextAlign("center");
    obj.label81:setText("Atribuições");
    obj.label81:setName("label81");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout2);
    obj.layout7:setAlign("top");
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout7);
    obj.label82:setLeft(5);
    obj.label82:setTop(0);
    obj.label82:setWidth(100);
    obj.label82:setHeight(25);
    obj.label82:setHorzTextAlign("center");
    obj.label82:setText("Reg. de Vida");
    obj.label82:setFontSize(13);
    obj.label82:setName("label82");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout7);
    obj.rectangle41:setLeft(105);
    obj.rectangle41:setTop(0);
    obj.rectangle41:setWidth(50);
    obj.rectangle41:setHeight(25);
    obj.rectangle41:setColor("black");
    obj.rectangle41:setStrokeColor("white");
    obj.rectangle41:setStrokeSize(1);
    obj.rectangle41:setName("rectangle41");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout7);
    obj.label83:setLeft(105);
    obj.label83:setTop(0);
    obj.label83:setWidth(50);
    obj.label83:setHeight(25);
    obj.label83:setHorzTextAlign("center");
    obj.label83:setField("regVidaBase");
    obj.label83:setName("label83");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout7);
    obj.edit43:setLeft(155);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(75);
    obj.edit43:setHeight(25);
    obj.edit43:setField("regVidaAdicional");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setType("number");
    obj.edit43:setName("edit43");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout7);
    obj.rectangle42:setLeft(230);
    obj.rectangle42:setTop(0);
    obj.rectangle42:setWidth(75);
    obj.rectangle42:setHeight(25);
    obj.rectangle42:setColor("black");
    obj.rectangle42:setStrokeColor("white");
    obj.rectangle42:setStrokeSize(1);
    obj.rectangle42:setName("rectangle42");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout7);
    obj.label84:setLeft(230);
    obj.label84:setTop(0);
    obj.label84:setWidth(75);
    obj.label84:setHeight(25);
    obj.label84:setHorzTextAlign("center");
    obj.label84:setField("regVidaTotal");
    obj.label84:setName("label84");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout2);
    obj.dataLink20:setFields({'regVidaBase','regVidaAdicional'});
    obj.dataLink20:setName("dataLink20");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout2);
    obj.layout8:setAlign("top");
    obj.layout8:setHeight(25);
    obj.layout8:setName("layout8");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout8);
    obj.label85:setLeft(5);
    obj.label85:setTop(0);
    obj.label85:setWidth(100);
    obj.label85:setHeight(25);
    obj.label85:setHorzTextAlign("center");
    obj.label85:setText("Reg. de Fadiga");
    obj.label85:setFontSize(13);
    obj.label85:setName("label85");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout8);
    obj.rectangle43:setLeft(105);
    obj.rectangle43:setTop(0);
    obj.rectangle43:setWidth(50);
    obj.rectangle43:setHeight(25);
    obj.rectangle43:setColor("black");
    obj.rectangle43:setStrokeColor("white");
    obj.rectangle43:setStrokeSize(1);
    obj.rectangle43:setName("rectangle43");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout8);
    obj.label86:setLeft(105);
    obj.label86:setTop(0);
    obj.label86:setWidth(50);
    obj.label86:setHeight(25);
    obj.label86:setHorzTextAlign("center");
    obj.label86:setField("regFadigaBase");
    obj.label86:setName("label86");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout8);
    obj.edit44:setLeft(155);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(75);
    obj.edit44:setHeight(25);
    obj.edit44:setField("regFadigaAdicional");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setType("number");
    obj.edit44:setName("edit44");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout8);
    obj.rectangle44:setLeft(230);
    obj.rectangle44:setTop(0);
    obj.rectangle44:setWidth(75);
    obj.rectangle44:setHeight(25);
    obj.rectangle44:setColor("black");
    obj.rectangle44:setStrokeColor("white");
    obj.rectangle44:setStrokeSize(1);
    obj.rectangle44:setName("rectangle44");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout8);
    obj.label87:setLeft(230);
    obj.label87:setTop(0);
    obj.label87:setWidth(75);
    obj.label87:setHeight(25);
    obj.label87:setHorzTextAlign("center");
    obj.label87:setField("regFadigaTotal");
    obj.label87:setName("label87");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout2);
    obj.dataLink21:setFields({'regFadigaBase','regFadigaAdicional'});
    obj.dataLink21:setName("dataLink21");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout2);
    obj.layout9:setAlign("top");
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout9);
    obj.label88:setLeft(5);
    obj.label88:setTop(0);
    obj.label88:setWidth(100);
    obj.label88:setHeight(25);
    obj.label88:setHorzTextAlign("center");
    obj.label88:setText("Act. Padrão");
    obj.label88:setFontSize(11);
    obj.label88:setName("label88");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout9);
    obj.rectangle45:setLeft(105);
    obj.rectangle45:setTop(0);
    obj.rectangle45:setWidth(50);
    obj.rectangle45:setHeight(25);
    obj.rectangle45:setColor("black");
    obj.rectangle45:setStrokeColor("white");
    obj.rectangle45:setStrokeSize(1);
    obj.rectangle45:setName("rectangle45");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout9);
    obj.label89:setLeft(105);
    obj.label89:setTop(0);
    obj.label89:setWidth(50);
    obj.label89:setHeight(25);
    obj.label89:setHorzTextAlign("center");
    obj.label89:setField("actPadraoBase");
    obj.label89:setName("label89");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout9);
    obj.edit45:setLeft(155);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(75);
    obj.edit45:setHeight(25);
    obj.edit45:setField("actPadraoAdicional");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setType("number");
    obj.edit45:setName("edit45");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout9);
    obj.rectangle46:setLeft(230);
    obj.rectangle46:setTop(0);
    obj.rectangle46:setWidth(75);
    obj.rectangle46:setHeight(25);
    obj.rectangle46:setColor("black");
    obj.rectangle46:setStrokeColor("white");
    obj.rectangle46:setStrokeSize(1);
    obj.rectangle46:setName("rectangle46");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout9);
    obj.label90:setLeft(230);
    obj.label90:setTop(0);
    obj.label90:setWidth(75);
    obj.label90:setHeight(25);
    obj.label90:setHorzTextAlign("center");
    obj.label90:setField("actPadraoTotal");
    obj.label90:setName("label90");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout2);
    obj.dataLink22:setFields({'actPadraoBase','actPadraoAdicional','equip_arma_act','equip_arma2_act','equip_equipamento_act','equip_vestimenta_act'});
    obj.dataLink22:setName("dataLink22");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout2);
    obj.layout10:setAlign("top");
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout10);
    obj.label91:setLeft(5);
    obj.label91:setTop(0);
    obj.label91:setWidth(100);
    obj.label91:setHeight(25);
    obj.label91:setHorzTextAlign("center");
    obj.label91:setText("Pts. de Instantânea");
    obj.label91:setFontSize(9);
    obj.label91:setName("label91");

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout10);
    obj.rectangle47:setLeft(105);
    obj.rectangle47:setTop(0);
    obj.rectangle47:setWidth(50);
    obj.rectangle47:setHeight(25);
    obj.rectangle47:setColor("black");
    obj.rectangle47:setStrokeColor("white");
    obj.rectangle47:setStrokeSize(1);
    obj.rectangle47:setName("rectangle47");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout10);
    obj.label92:setLeft(105);
    obj.label92:setTop(0);
    obj.label92:setWidth(50);
    obj.label92:setHeight(25);
    obj.label92:setHorzTextAlign("center");
    obj.label92:setField("ptsInstantaneaBase");
    obj.label92:setName("label92");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout10);
    obj.edit46:setLeft(155);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(75);
    obj.edit46:setHeight(25);
    obj.edit46:setField("ptsInstantaneaAdicional");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setType("number");
    obj.edit46:setName("edit46");

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout10);
    obj.rectangle48:setLeft(230);
    obj.rectangle48:setTop(0);
    obj.rectangle48:setWidth(75);
    obj.rectangle48:setHeight(25);
    obj.rectangle48:setColor("black");
    obj.rectangle48:setStrokeColor("white");
    obj.rectangle48:setStrokeSize(1);
    obj.rectangle48:setName("rectangle48");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout10);
    obj.label93:setLeft(230);
    obj.label93:setTop(0);
    obj.label93:setWidth(75);
    obj.label93:setHeight(25);
    obj.label93:setHorzTextAlign("center");
    obj.label93:setField("ptsInstantaneaTotal");
    obj.label93:setName("label93");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout2);
    obj.dataLink23:setFields({'ptsInstantaneaBase','ptsInstantaneaAdicional'});
    obj.dataLink23:setName("dataLink23");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout2);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(25);
    obj.layout11:setName("layout11");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout11);
    obj.label94:setLeft(5);
    obj.label94:setTop(0);
    obj.label94:setWidth(100);
    obj.label94:setHeight(25);
    obj.label94:setHorzTextAlign("center");
    obj.label94:setText("Chance de Crítico");
    obj.label94:setFontSize(11);
    obj.label94:setName("label94");

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout11);
    obj.rectangle49:setLeft(105);
    obj.rectangle49:setTop(0);
    obj.rectangle49:setWidth(50);
    obj.rectangle49:setHeight(25);
    obj.rectangle49:setColor("black");
    obj.rectangle49:setStrokeColor("white");
    obj.rectangle49:setStrokeSize(1);
    obj.rectangle49:setName("rectangle49");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout11);
    obj.label95:setLeft(105);
    obj.label95:setTop(0);
    obj.label95:setWidth(50);
    obj.label95:setHeight(25);
    obj.label95:setHorzTextAlign("center");
    obj.label95:setField("criticoBase");
    obj.label95:setName("label95");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout11);
    obj.edit47:setLeft(155);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(75);
    obj.edit47:setHeight(25);
    obj.edit47:setField("criticoAdicional");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setType("number");
    obj.edit47:setName("edit47");

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout11);
    obj.rectangle50:setLeft(230);
    obj.rectangle50:setTop(0);
    obj.rectangle50:setWidth(75);
    obj.rectangle50:setHeight(25);
    obj.rectangle50:setColor("black");
    obj.rectangle50:setStrokeColor("white");
    obj.rectangle50:setStrokeSize(1);
    obj.rectangle50:setName("rectangle50");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout11);
    obj.label96:setLeft(230);
    obj.label96:setTop(0);
    obj.label96:setWidth(75);
    obj.label96:setHeight(25);
    obj.label96:setHorzTextAlign("center");
    obj.label96:setField("criticoTotal");
    obj.label96:setName("label96");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout2);
    obj.dataLink24:setFields({'criticoBase','criticoAdicional'});
    obj.dataLink24:setName("dataLink24");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout2);
    obj.layout12:setAlign("top");
    obj.layout12:setHeight(25);
    obj.layout12:setName("layout12");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout12);
    obj.label97:setLeft(5);
    obj.label97:setTop(0);
    obj.label97:setWidth(100);
    obj.label97:setHeight(25);
    obj.label97:setHorzTextAlign("center");
    obj.label97:setText("Amplificação");
    obj.label97:setFontSize(13);
    obj.label97:setName("label97");

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout12);
    obj.rectangle51:setLeft(105);
    obj.rectangle51:setTop(0);
    obj.rectangle51:setWidth(50);
    obj.rectangle51:setHeight(25);
    obj.rectangle51:setColor("black");
    obj.rectangle51:setStrokeColor("white");
    obj.rectangle51:setStrokeSize(1);
    obj.rectangle51:setName("rectangle51");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout12);
    obj.label98:setLeft(105);
    obj.label98:setTop(0);
    obj.label98:setWidth(50);
    obj.label98:setHeight(25);
    obj.label98:setHorzTextAlign("center");
    obj.label98:setField("amplificacaoBase");
    obj.label98:setName("label98");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout12);
    obj.edit48:setLeft(155);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(75);
    obj.edit48:setHeight(25);
    obj.edit48:setField("amplificacaoAdicional");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setType("number");
    obj.edit48:setName("edit48");

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout12);
    obj.rectangle52:setLeft(230);
    obj.rectangle52:setTop(0);
    obj.rectangle52:setWidth(75);
    obj.rectangle52:setHeight(25);
    obj.rectangle52:setColor("black");
    obj.rectangle52:setStrokeColor("white");
    obj.rectangle52:setStrokeSize(1);
    obj.rectangle52:setName("rectangle52");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout12);
    obj.label99:setLeft(230);
    obj.label99:setTop(0);
    obj.label99:setWidth(75);
    obj.label99:setHeight(25);
    obj.label99:setHorzTextAlign("center");
    obj.label99:setField("amplificacaoTotal");
    obj.label99:setName("label99");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout2);
    obj.dataLink25:setFields({'amplificacaoBase','amplificacaoAdicional'});
    obj.dataLink25:setName("dataLink25");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout2);
    obj.layout13:setAlign("top");
    obj.layout13:setHeight(25);
    obj.layout13:setName("layout13");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout13);
    obj.label100:setLeft(5);
    obj.label100:setTop(0);
    obj.label100:setWidth(100);
    obj.label100:setHeight(25);
    obj.label100:setHorzTextAlign("center");
    obj.label100:setText("Negação");
    obj.label100:setFontSize(13);
    obj.label100:setName("label100");

    obj.rectangle53 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout13);
    obj.rectangle53:setLeft(105);
    obj.rectangle53:setTop(0);
    obj.rectangle53:setWidth(50);
    obj.rectangle53:setHeight(25);
    obj.rectangle53:setColor("black");
    obj.rectangle53:setStrokeColor("white");
    obj.rectangle53:setStrokeSize(1);
    obj.rectangle53:setName("rectangle53");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout13);
    obj.label101:setLeft(105);
    obj.label101:setTop(0);
    obj.label101:setWidth(50);
    obj.label101:setHeight(25);
    obj.label101:setHorzTextAlign("center");
    obj.label101:setField("negacaoBase");
    obj.label101:setName("label101");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout13);
    obj.edit49:setLeft(155);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(75);
    obj.edit49:setHeight(25);
    obj.edit49:setField("negacaoAdicional");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setType("number");
    obj.edit49:setName("edit49");

    obj.rectangle54 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.layout13);
    obj.rectangle54:setLeft(230);
    obj.rectangle54:setTop(0);
    obj.rectangle54:setWidth(75);
    obj.rectangle54:setHeight(25);
    obj.rectangle54:setColor("black");
    obj.rectangle54:setStrokeColor("white");
    obj.rectangle54:setStrokeSize(1);
    obj.rectangle54:setName("rectangle54");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout13);
    obj.label102:setLeft(230);
    obj.label102:setTop(0);
    obj.label102:setWidth(75);
    obj.label102:setHeight(25);
    obj.label102:setHorzTextAlign("center");
    obj.label102:setField("negacaoTotal");
    obj.label102:setName("label102");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout2);
    obj.dataLink26:setFields({'negacaoBase','negacaoAdicional'});
    obj.dataLink26:setName("dataLink26");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout2);
    obj.label103:setAlign("top");
    obj.label103:setHeight(20);
    obj.label103:setHorzTextAlign("center");
    obj.label103:setText("Defesa");
    obj.label103:setName("label103");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout2);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(25);
    obj.layout14:setName("layout14");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout14);
    obj.label104:setAlign("left");
    obj.label104:setWidth(100);
    obj.label104:setHorzTextAlign("center");
    obj.label104:setText("Bloq. Físico");
    obj.label104:setName("label104");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout14);
    obj.edit50:setAlign("left");
    obj.edit50:setWidth(55);
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setField("bloqueioFis");
    obj.edit50:setName("edit50");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout14);
    obj.label105:setAlign("left");
    obj.label105:setWidth(100);
    obj.label105:setHorzTextAlign("center");
    obj.label105:setText("Bloq. Paranormal");
    obj.label105:setName("label105");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout14);
    obj.edit51:setAlign("left");
    obj.edit51:setWidth(55);
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setField("bloqueioPar");
    obj.edit51:setName("edit51");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle31);
    obj.layout15:setAlign("left");
    obj.layout15:setWidth(310);
    obj.layout15:setName("layout15");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout15);
    obj.label106:setAlign("top");
    obj.label106:setHeight(20);
    obj.label106:setHorzTextAlign("center");
    obj.label106:setText("Redutores");
    obj.label106:setName("label106");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout15);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout16);
    obj.label107:setLeft(5);
    obj.label107:setTop(0);
    obj.label107:setWidth(100);
    obj.label107:setHeight(25);
    obj.label107:setHorzTextAlign("center");
    obj.label107:setText("Físico");
    obj.label107:setFontSize(13);
    obj.label107:setName("label107");

    obj.rectangle55 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.layout16);
    obj.rectangle55:setLeft(105);
    obj.rectangle55:setTop(0);
    obj.rectangle55:setWidth(50);
    obj.rectangle55:setHeight(25);
    obj.rectangle55:setColor("black");
    obj.rectangle55:setStrokeColor("white");
    obj.rectangle55:setStrokeSize(1);
    obj.rectangle55:setName("rectangle55");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout16);
    obj.label108:setLeft(105);
    obj.label108:setTop(0);
    obj.label108:setWidth(50);
    obj.label108:setHeight(25);
    obj.label108:setHorzTextAlign("center");
    obj.label108:setField("fisicoBase");
    obj.label108:setName("label108");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout16);
    obj.edit52:setLeft(155);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(75);
    obj.edit52:setHeight(25);
    obj.edit52:setField("fisicoAdicional");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setType("number");
    obj.edit52:setName("edit52");

    obj.rectangle56 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.layout16);
    obj.rectangle56:setLeft(230);
    obj.rectangle56:setTop(0);
    obj.rectangle56:setWidth(75);
    obj.rectangle56:setHeight(25);
    obj.rectangle56:setColor("black");
    obj.rectangle56:setStrokeColor("white");
    obj.rectangle56:setStrokeSize(1);
    obj.rectangle56:setName("rectangle56");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout16);
    obj.label109:setLeft(230);
    obj.label109:setTop(0);
    obj.label109:setWidth(75);
    obj.label109:setHeight(25);
    obj.label109:setHorzTextAlign("center");
    obj.label109:setField("fisicoTotal");
    obj.label109:setName("label109");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout15);
    obj.dataLink27:setFields({'fisicoBase','fisicoAdicional'});
    obj.dataLink27:setName("dataLink27");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout15);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout17);
    obj.label110:setLeft(5);
    obj.label110:setTop(0);
    obj.label110:setWidth(100);
    obj.label110:setHeight(25);
    obj.label110:setHorzTextAlign("center");
    obj.label110:setText("Paranormal");
    obj.label110:setFontSize(13);
    obj.label110:setName("label110");

    obj.rectangle57 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.layout17);
    obj.rectangle57:setLeft(105);
    obj.rectangle57:setTop(0);
    obj.rectangle57:setWidth(50);
    obj.rectangle57:setHeight(25);
    obj.rectangle57:setColor("black");
    obj.rectangle57:setStrokeColor("white");
    obj.rectangle57:setStrokeSize(1);
    obj.rectangle57:setName("rectangle57");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout17);
    obj.label111:setLeft(105);
    obj.label111:setTop(0);
    obj.label111:setWidth(50);
    obj.label111:setHeight(25);
    obj.label111:setHorzTextAlign("center");
    obj.label111:setField("paranormalBase");
    obj.label111:setName("label111");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout17);
    obj.edit53:setLeft(155);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(75);
    obj.edit53:setHeight(25);
    obj.edit53:setField("paranormalAdicional");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setType("number");
    obj.edit53:setName("edit53");

    obj.rectangle58 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.layout17);
    obj.rectangle58:setLeft(230);
    obj.rectangle58:setTop(0);
    obj.rectangle58:setWidth(75);
    obj.rectangle58:setHeight(25);
    obj.rectangle58:setColor("black");
    obj.rectangle58:setStrokeColor("white");
    obj.rectangle58:setStrokeSize(1);
    obj.rectangle58:setName("rectangle58");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout17);
    obj.label112:setLeft(230);
    obj.label112:setTop(0);
    obj.label112:setWidth(75);
    obj.label112:setHeight(25);
    obj.label112:setHorzTextAlign("center");
    obj.label112:setField("paranormalTotal");
    obj.label112:setName("label112");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.layout15);
    obj.dataLink28:setFields({'paranormalBase','paranormalAdicional'});
    obj.dataLink28:setName("dataLink28");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout15);
    obj.layout18:setAlign("top");
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout18);
    obj.label113:setLeft(5);
    obj.label113:setTop(0);
    obj.label113:setWidth(100);
    obj.label113:setHeight(25);
    obj.label113:setHorzTextAlign("center");
    obj.label113:setText("Projétil");
    obj.label113:setFontSize(13);
    obj.label113:setName("label113");

    obj.rectangle59 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.layout18);
    obj.rectangle59:setLeft(105);
    obj.rectangle59:setTop(0);
    obj.rectangle59:setWidth(50);
    obj.rectangle59:setHeight(25);
    obj.rectangle59:setColor("black");
    obj.rectangle59:setStrokeColor("white");
    obj.rectangle59:setStrokeSize(1);
    obj.rectangle59:setName("rectangle59");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout18);
    obj.label114:setLeft(105);
    obj.label114:setTop(0);
    obj.label114:setWidth(50);
    obj.label114:setHeight(25);
    obj.label114:setHorzTextAlign("center");
    obj.label114:setField("projetilBase");
    obj.label114:setName("label114");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout18);
    obj.edit54:setLeft(155);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(75);
    obj.edit54:setHeight(25);
    obj.edit54:setField("projetilAdicional");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setType("number");
    obj.edit54:setName("edit54");

    obj.rectangle60 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.layout18);
    obj.rectangle60:setLeft(230);
    obj.rectangle60:setTop(0);
    obj.rectangle60:setWidth(75);
    obj.rectangle60:setHeight(25);
    obj.rectangle60:setColor("black");
    obj.rectangle60:setStrokeColor("white");
    obj.rectangle60:setStrokeSize(1);
    obj.rectangle60:setName("rectangle60");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout18);
    obj.label115:setLeft(230);
    obj.label115:setTop(0);
    obj.label115:setWidth(75);
    obj.label115:setHeight(25);
    obj.label115:setHorzTextAlign("center");
    obj.label115:setField("projetilTotal");
    obj.label115:setName("label115");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.layout15);
    obj.dataLink29:setFields({'projetilBase','projetilAdicional'});
    obj.dataLink29:setName("dataLink29");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout15);
    obj.layout19:setAlign("top");
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout19);
    obj.label116:setLeft(5);
    obj.label116:setTop(0);
    obj.label116:setWidth(100);
    obj.label116:setHeight(25);
    obj.label116:setHorzTextAlign("center");
    obj.label116:setText("Corrosivo");
    obj.label116:setFontSize(13);
    obj.label116:setName("label116");

    obj.rectangle61 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.layout19);
    obj.rectangle61:setLeft(105);
    obj.rectangle61:setTop(0);
    obj.rectangle61:setWidth(50);
    obj.rectangle61:setHeight(25);
    obj.rectangle61:setColor("black");
    obj.rectangle61:setStrokeColor("white");
    obj.rectangle61:setStrokeSize(1);
    obj.rectangle61:setName("rectangle61");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout19);
    obj.label117:setLeft(105);
    obj.label117:setTop(0);
    obj.label117:setWidth(50);
    obj.label117:setHeight(25);
    obj.label117:setHorzTextAlign("center");
    obj.label117:setField("corrosivoBase");
    obj.label117:setName("label117");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout19);
    obj.edit55:setLeft(155);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(75);
    obj.edit55:setHeight(25);
    obj.edit55:setField("corrosivoAdicional");
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setType("number");
    obj.edit55:setName("edit55");

    obj.rectangle62 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.layout19);
    obj.rectangle62:setLeft(230);
    obj.rectangle62:setTop(0);
    obj.rectangle62:setWidth(75);
    obj.rectangle62:setHeight(25);
    obj.rectangle62:setColor("black");
    obj.rectangle62:setStrokeColor("white");
    obj.rectangle62:setStrokeSize(1);
    obj.rectangle62:setName("rectangle62");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout19);
    obj.label118:setLeft(230);
    obj.label118:setTop(0);
    obj.label118:setWidth(75);
    obj.label118:setHeight(25);
    obj.label118:setHorzTextAlign("center");
    obj.label118:setField("corrosivoTotal");
    obj.label118:setName("label118");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.layout15);
    obj.dataLink30:setFields({'corrosivoBase','corrosivoAdicional'});
    obj.dataLink30:setName("dataLink30");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout15);
    obj.label119:setAlign("top");
    obj.label119:setHeight(20);
    obj.label119:setHorzTextAlign("center");
    obj.label119:setText("Resistências");
    obj.label119:setName("label119");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout15);
    obj.layout20:setAlign("top");
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout20);
    obj.label120:setLeft(5);
    obj.label120:setTop(0);
    obj.label120:setWidth(100);
    obj.label120:setHeight(25);
    obj.label120:setHorzTextAlign("center");
    obj.label120:setText("Impelimento");
    obj.label120:setFontSize(13);
    obj.label120:setName("label120");

    obj.rectangle63 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle63:setParent(obj.layout20);
    obj.rectangle63:setLeft(105);
    obj.rectangle63:setTop(0);
    obj.rectangle63:setWidth(50);
    obj.rectangle63:setHeight(25);
    obj.rectangle63:setColor("black");
    obj.rectangle63:setStrokeColor("white");
    obj.rectangle63:setStrokeSize(1);
    obj.rectangle63:setName("rectangle63");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout20);
    obj.label121:setLeft(105);
    obj.label121:setTop(0);
    obj.label121:setWidth(50);
    obj.label121:setHeight(25);
    obj.label121:setHorzTextAlign("center");
    obj.label121:setField("impelimentoBase");
    obj.label121:setName("label121");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout20);
    obj.edit56:setLeft(155);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(75);
    obj.edit56:setHeight(25);
    obj.edit56:setField("impelimentoAdicional");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setType("number");
    obj.edit56:setName("edit56");

    obj.rectangle64 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle64:setParent(obj.layout20);
    obj.rectangle64:setLeft(230);
    obj.rectangle64:setTop(0);
    obj.rectangle64:setWidth(75);
    obj.rectangle64:setHeight(25);
    obj.rectangle64:setColor("black");
    obj.rectangle64:setStrokeColor("white");
    obj.rectangle64:setStrokeSize(1);
    obj.rectangle64:setName("rectangle64");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout20);
    obj.label122:setLeft(230);
    obj.label122:setTop(0);
    obj.label122:setWidth(75);
    obj.label122:setHeight(25);
    obj.label122:setHorzTextAlign("center");
    obj.label122:setField("impelimentoTotal");
    obj.label122:setName("label122");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.layout15);
    obj.dataLink31:setFields({'impelimentoBase','impelimentoAdicional'});
    obj.dataLink31:setName("dataLink31");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout15);
    obj.layout21:setAlign("top");
    obj.layout21:setHeight(25);
    obj.layout21:setName("layout21");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout21);
    obj.label123:setLeft(5);
    obj.label123:setTop(0);
    obj.label123:setWidth(100);
    obj.label123:setHeight(25);
    obj.label123:setHorzTextAlign("center");
    obj.label123:setText("Sangramento");
    obj.label123:setFontSize(13);
    obj.label123:setName("label123");

    obj.rectangle65 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle65:setParent(obj.layout21);
    obj.rectangle65:setLeft(105);
    obj.rectangle65:setTop(0);
    obj.rectangle65:setWidth(50);
    obj.rectangle65:setHeight(25);
    obj.rectangle65:setColor("black");
    obj.rectangle65:setStrokeColor("white");
    obj.rectangle65:setStrokeSize(1);
    obj.rectangle65:setName("rectangle65");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout21);
    obj.label124:setLeft(105);
    obj.label124:setTop(0);
    obj.label124:setWidth(50);
    obj.label124:setHeight(25);
    obj.label124:setHorzTextAlign("center");
    obj.label124:setField("sangramentoBase");
    obj.label124:setName("label124");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout21);
    obj.edit57:setLeft(155);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(75);
    obj.edit57:setHeight(25);
    obj.edit57:setField("sangramentoAdicional");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setType("number");
    obj.edit57:setName("edit57");

    obj.rectangle66 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle66:setParent(obj.layout21);
    obj.rectangle66:setLeft(230);
    obj.rectangle66:setTop(0);
    obj.rectangle66:setWidth(75);
    obj.rectangle66:setHeight(25);
    obj.rectangle66:setColor("black");
    obj.rectangle66:setStrokeColor("white");
    obj.rectangle66:setStrokeSize(1);
    obj.rectangle66:setName("rectangle66");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout21);
    obj.label125:setLeft(230);
    obj.label125:setTop(0);
    obj.label125:setWidth(75);
    obj.label125:setHeight(25);
    obj.label125:setHorzTextAlign("center");
    obj.label125:setField("sangramentoTotal");
    obj.label125:setName("label125");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.layout15);
    obj.dataLink32:setFields({'sangramentoBase','sangramentoAdicional'});
    obj.dataLink32:setName("dataLink32");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout15);
    obj.layout22:setAlign("top");
    obj.layout22:setHeight(25);
    obj.layout22:setName("layout22");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout22);
    obj.label126:setLeft(5);
    obj.label126:setTop(0);
    obj.label126:setWidth(100);
    obj.label126:setHeight(25);
    obj.label126:setHorzTextAlign("center");
    obj.label126:setText("Fragilização");
    obj.label126:setFontSize(13);
    obj.label126:setName("label126");

    obj.rectangle67 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle67:setParent(obj.layout22);
    obj.rectangle67:setLeft(105);
    obj.rectangle67:setTop(0);
    obj.rectangle67:setWidth(50);
    obj.rectangle67:setHeight(25);
    obj.rectangle67:setColor("black");
    obj.rectangle67:setStrokeColor("white");
    obj.rectangle67:setStrokeSize(1);
    obj.rectangle67:setName("rectangle67");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout22);
    obj.label127:setLeft(105);
    obj.label127:setTop(0);
    obj.label127:setWidth(50);
    obj.label127:setHeight(25);
    obj.label127:setHorzTextAlign("center");
    obj.label127:setField("fragilizacaoBase");
    obj.label127:setName("label127");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout22);
    obj.edit58:setLeft(155);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(75);
    obj.edit58:setHeight(25);
    obj.edit58:setField("fragilizacaoAdicional");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setType("number");
    obj.edit58:setName("edit58");

    obj.rectangle68 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle68:setParent(obj.layout22);
    obj.rectangle68:setLeft(230);
    obj.rectangle68:setTop(0);
    obj.rectangle68:setWidth(75);
    obj.rectangle68:setHeight(25);
    obj.rectangle68:setColor("black");
    obj.rectangle68:setStrokeColor("white");
    obj.rectangle68:setStrokeSize(1);
    obj.rectangle68:setName("rectangle68");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout22);
    obj.label128:setLeft(230);
    obj.label128:setTop(0);
    obj.label128:setWidth(75);
    obj.label128:setHeight(25);
    obj.label128:setHorzTextAlign("center");
    obj.label128:setField("fragilizacaoTotal");
    obj.label128:setName("label128");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.layout15);
    obj.dataLink33:setFields({'fragilizacaoBase','fragilizacaoAdicional'});
    obj.dataLink33:setName("dataLink33");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout15);
    obj.layout23:setAlign("top");
    obj.layout23:setHeight(25);
    obj.layout23:setName("layout23");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout23);
    obj.label129:setLeft(5);
    obj.label129:setTop(0);
    obj.label129:setWidth(100);
    obj.label129:setHeight(25);
    obj.label129:setHorzTextAlign("center");
    obj.label129:setText("Aturdido");
    obj.label129:setFontSize(13);
    obj.label129:setName("label129");

    obj.rectangle69 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle69:setParent(obj.layout23);
    obj.rectangle69:setLeft(105);
    obj.rectangle69:setTop(0);
    obj.rectangle69:setWidth(50);
    obj.rectangle69:setHeight(25);
    obj.rectangle69:setColor("black");
    obj.rectangle69:setStrokeColor("white");
    obj.rectangle69:setStrokeSize(1);
    obj.rectangle69:setName("rectangle69");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout23);
    obj.label130:setLeft(105);
    obj.label130:setTop(0);
    obj.label130:setWidth(50);
    obj.label130:setHeight(25);
    obj.label130:setHorzTextAlign("center");
    obj.label130:setField("atordoamentoBase");
    obj.label130:setName("label130");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout23);
    obj.edit59:setLeft(155);
    obj.edit59:setTop(0);
    obj.edit59:setWidth(75);
    obj.edit59:setHeight(25);
    obj.edit59:setField("atordoamentoAdicional");
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setType("number");
    obj.edit59:setName("edit59");

    obj.rectangle70 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle70:setParent(obj.layout23);
    obj.rectangle70:setLeft(230);
    obj.rectangle70:setTop(0);
    obj.rectangle70:setWidth(75);
    obj.rectangle70:setHeight(25);
    obj.rectangle70:setColor("black");
    obj.rectangle70:setStrokeColor("white");
    obj.rectangle70:setStrokeSize(1);
    obj.rectangle70:setName("rectangle70");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout23);
    obj.label131:setLeft(230);
    obj.label131:setTop(0);
    obj.label131:setWidth(75);
    obj.label131:setHeight(25);
    obj.label131:setHorzTextAlign("center");
    obj.label131:setField("atordoamentoTotal");
    obj.label131:setName("label131");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.layout15);
    obj.dataLink34:setFields({'atordoamentoBase','atordoamentoAdicional'});
    obj.dataLink34:setName("dataLink34");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout15);
    obj.layout24:setAlign("top");
    obj.layout24:setHeight(25);
    obj.layout24:setName("layout24");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout24);
    obj.label132:setLeft(5);
    obj.label132:setTop(0);
    obj.label132:setWidth(100);
    obj.label132:setHeight(25);
    obj.label132:setHorzTextAlign("center");
    obj.label132:setText("Provocação");
    obj.label132:setFontSize(13);
    obj.label132:setName("label132");

    obj.rectangle71 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle71:setParent(obj.layout24);
    obj.rectangle71:setLeft(105);
    obj.rectangle71:setTop(0);
    obj.rectangle71:setWidth(50);
    obj.rectangle71:setHeight(25);
    obj.rectangle71:setColor("black");
    obj.rectangle71:setStrokeColor("white");
    obj.rectangle71:setStrokeSize(1);
    obj.rectangle71:setName("rectangle71");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.layout24);
    obj.label133:setLeft(105);
    obj.label133:setTop(0);
    obj.label133:setWidth(50);
    obj.label133:setHeight(25);
    obj.label133:setHorzTextAlign("center");
    obj.label133:setField("provocacaoBase");
    obj.label133:setName("label133");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout24);
    obj.edit60:setLeft(155);
    obj.edit60:setTop(0);
    obj.edit60:setWidth(75);
    obj.edit60:setHeight(25);
    obj.edit60:setField("provocacaoAdicional");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setType("number");
    obj.edit60:setName("edit60");

    obj.rectangle72 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle72:setParent(obj.layout24);
    obj.rectangle72:setLeft(230);
    obj.rectangle72:setTop(0);
    obj.rectangle72:setWidth(75);
    obj.rectangle72:setHeight(25);
    obj.rectangle72:setColor("black");
    obj.rectangle72:setStrokeColor("white");
    obj.rectangle72:setStrokeSize(1);
    obj.rectangle72:setName("rectangle72");

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout24);
    obj.label134:setLeft(230);
    obj.label134:setTop(0);
    obj.label134:setWidth(75);
    obj.label134:setHeight(25);
    obj.label134:setHorzTextAlign("center");
    obj.label134:setField("provocacaoTotal");
    obj.label134:setName("label134");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.layout15);
    obj.dataLink35:setFields({'provocacaoBase','provocacaoAdicional'});
    obj.dataLink35:setName("dataLink35");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout15);
    obj.layout25:setAlign("top");
    obj.layout25:setHeight(25);
    obj.layout25:setName("layout25");

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.layout25);
    obj.label135:setLeft(5);
    obj.label135:setTop(0);
    obj.label135:setWidth(100);
    obj.label135:setHeight(25);
    obj.label135:setHorzTextAlign("center");
    obj.label135:setText("Silenciamento");
    obj.label135:setFontSize(13);
    obj.label135:setName("label135");

    obj.rectangle73 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle73:setParent(obj.layout25);
    obj.rectangle73:setLeft(105);
    obj.rectangle73:setTop(0);
    obj.rectangle73:setWidth(50);
    obj.rectangle73:setHeight(25);
    obj.rectangle73:setColor("black");
    obj.rectangle73:setStrokeColor("white");
    obj.rectangle73:setStrokeSize(1);
    obj.rectangle73:setName("rectangle73");

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout25);
    obj.label136:setLeft(105);
    obj.label136:setTop(0);
    obj.label136:setWidth(50);
    obj.label136:setHeight(25);
    obj.label136:setHorzTextAlign("center");
    obj.label136:setField("silenciadoBase");
    obj.label136:setName("label136");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout25);
    obj.edit61:setLeft(155);
    obj.edit61:setTop(0);
    obj.edit61:setWidth(75);
    obj.edit61:setHeight(25);
    obj.edit61:setField("silenciadoAdicional");
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setType("number");
    obj.edit61:setName("edit61");

    obj.rectangle74 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle74:setParent(obj.layout25);
    obj.rectangle74:setLeft(230);
    obj.rectangle74:setTop(0);
    obj.rectangle74:setWidth(75);
    obj.rectangle74:setHeight(25);
    obj.rectangle74:setColor("black");
    obj.rectangle74:setStrokeColor("white");
    obj.rectangle74:setStrokeSize(1);
    obj.rectangle74:setName("rectangle74");

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.layout25);
    obj.label137:setLeft(230);
    obj.label137:setTop(0);
    obj.label137:setWidth(75);
    obj.label137:setHeight(25);
    obj.label137:setHorzTextAlign("center");
    obj.label137:setField("silenciadoTotal");
    obj.label137:setName("label137");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.layout15);
    obj.dataLink36:setFields({'silenciadoBase','silenciadoAdicional'});
    obj.dataLink36:setName("dataLink36");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout15);
    obj.layout26:setAlign("top");
    obj.layout26:setHeight(25);
    obj.layout26:setName("layout26");

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout26);
    obj.label138:setLeft(5);
    obj.label138:setTop(0);
    obj.label138:setWidth(100);
    obj.label138:setHeight(25);
    obj.label138:setHorzTextAlign("center");
    obj.label138:setText("Envenenamento");
    obj.label138:setFontSize(13);
    obj.label138:setName("label138");

    obj.rectangle75 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle75:setParent(obj.layout26);
    obj.rectangle75:setLeft(105);
    obj.rectangle75:setTop(0);
    obj.rectangle75:setWidth(50);
    obj.rectangle75:setHeight(25);
    obj.rectangle75:setColor("black");
    obj.rectangle75:setStrokeColor("white");
    obj.rectangle75:setStrokeSize(1);
    obj.rectangle75:setName("rectangle75");

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout26);
    obj.label139:setLeft(105);
    obj.label139:setTop(0);
    obj.label139:setWidth(50);
    obj.label139:setHeight(25);
    obj.label139:setHorzTextAlign("center");
    obj.label139:setField("envenenamentoBase");
    obj.label139:setName("label139");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout26);
    obj.edit62:setLeft(155);
    obj.edit62:setTop(0);
    obj.edit62:setWidth(75);
    obj.edit62:setHeight(25);
    obj.edit62:setField("envenenamentoAdicional");
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setType("number");
    obj.edit62:setName("edit62");

    obj.rectangle76 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle76:setParent(obj.layout26);
    obj.rectangle76:setLeft(230);
    obj.rectangle76:setTop(0);
    obj.rectangle76:setWidth(75);
    obj.rectangle76:setHeight(25);
    obj.rectangle76:setColor("black");
    obj.rectangle76:setStrokeColor("white");
    obj.rectangle76:setStrokeSize(1);
    obj.rectangle76:setName("rectangle76");

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.layout26);
    obj.label140:setLeft(230);
    obj.label140:setTop(0);
    obj.label140:setWidth(75);
    obj.label140:setHeight(25);
    obj.label140:setHorzTextAlign("center");
    obj.label140:setField("envenenamentoTotal");
    obj.label140:setName("label140");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.layout15);
    obj.dataLink37:setFields({'envenenamentoBase','envenenamentoAdicional'});
    obj.dataLink37:setName("dataLink37");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout15);
    obj.layout27:setAlign("top");
    obj.layout27:setHeight(25);
    obj.layout27:setName("layout27");

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout27);
    obj.label141:setLeft(5);
    obj.label141:setTop(0);
    obj.label141:setWidth(100);
    obj.label141:setHeight(25);
    obj.label141:setHorzTextAlign("center");
    obj.label141:setText("Incendiado");
    obj.label141:setFontSize(13);
    obj.label141:setName("label141");

    obj.rectangle77 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle77:setParent(obj.layout27);
    obj.rectangle77:setLeft(105);
    obj.rectangle77:setTop(0);
    obj.rectangle77:setWidth(50);
    obj.rectangle77:setHeight(25);
    obj.rectangle77:setColor("black");
    obj.rectangle77:setStrokeColor("white");
    obj.rectangle77:setStrokeSize(1);
    obj.rectangle77:setName("rectangle77");

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.layout27);
    obj.label142:setLeft(105);
    obj.label142:setTop(0);
    obj.label142:setWidth(50);
    obj.label142:setHeight(25);
    obj.label142:setHorzTextAlign("center");
    obj.label142:setField("incendiadoBase");
    obj.label142:setName("label142");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout27);
    obj.edit63:setLeft(155);
    obj.edit63:setTop(0);
    obj.edit63:setWidth(75);
    obj.edit63:setHeight(25);
    obj.edit63:setField("incendiadoAdicional");
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setType("number");
    obj.edit63:setName("edit63");

    obj.rectangle78 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle78:setParent(obj.layout27);
    obj.rectangle78:setLeft(230);
    obj.rectangle78:setTop(0);
    obj.rectangle78:setWidth(75);
    obj.rectangle78:setHeight(25);
    obj.rectangle78:setColor("black");
    obj.rectangle78:setStrokeColor("white");
    obj.rectangle78:setStrokeSize(1);
    obj.rectangle78:setName("rectangle78");

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout27);
    obj.label143:setLeft(230);
    obj.label143:setTop(0);
    obj.label143:setWidth(75);
    obj.label143:setHeight(25);
    obj.label143:setHorzTextAlign("center");
    obj.label143:setField("incendiadoTotal");
    obj.label143:setName("label143");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.layout15);
    obj.dataLink38:setFields({'incendiadoBase','incendiadoAdicional'});
    obj.dataLink38:setName("dataLink38");

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.rectangle31);
    obj.dataLink39:setFields({'nivel', 'cac_total', 'paranormalidade_total', 'agilidade_total', 'sorte_total', 'manuseio_total', 'pontaria_total', 'cac_nivel', 'paranormalidade_nivel', 'manuseio_nivel'});
    obj.dataLink39:setName("dataLink39");

    obj.rectangle79 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle79:setParent(obj.scrollBox1);
    obj.rectangle79:setLeft(915);
    obj.rectangle79:setTop(0);
    obj.rectangle79:setWidth(465);
    obj.rectangle79:setHeight(680);
    obj.rectangle79:setColor("black");
    obj.rectangle79:setStrokeColor("white");
    obj.rectangle79:setStrokeSize(1);
    obj.rectangle79:setName("rectangle79");

    obj.label144 = GUI.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.rectangle79);
    obj.label144:setLeft(0);
    obj.label144:setTop(5);
    obj.label144:setWidth(210);
    obj.label144:setHeight(25);
    obj.label144:setHorzTextAlign("trailing");
    obj.label144:setText("Habilidades");
    obj.label144:setName("label144");

    obj.label145 = GUI.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.rectangle79);
    obj.label145:setLeft(405);
    obj.label145:setTop(5);
    obj.label145:setWidth(50);
    obj.label145:setHeight(25);
    obj.label145:setHorzTextAlign("center");
    obj.label145:setText("Estágio");
    obj.label145:setFontSize(11);
    obj.label145:setName("label145");

    obj.rectangle80 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle80:setParent(obj.rectangle79);
    obj.rectangle80:setLeft(215);
    obj.rectangle80:setTop(5);
    obj.rectangle80:setWidth(50);
    obj.rectangle80:setHeight(25);
    obj.rectangle80:setColor("black");
    obj.rectangle80:setStrokeColor("white");
    obj.rectangle80:setStrokeSize(1);
    obj.rectangle80:setName("rectangle80");

    obj.label146 = GUI.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.rectangle79);
    obj.label146:setLeft(215);
    obj.label146:setTop(5);
    obj.label146:setWidth(50);
    obj.label146:setHeight(25);
    obj.label146:setHorzTextAlign("center");
    obj.label146:setField("habilidadesNivel");
    obj.label146:setName("label146");

    obj.rectangle81 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle81:setParent(obj.rectangle79);
    obj.rectangle81:setLeft(270);
    obj.rectangle81:setTop(5);
    obj.rectangle81:setWidth(50);
    obj.rectangle81:setHeight(25);
    obj.rectangle81:setColor("black");
    obj.rectangle81:setStrokeColor("white");
    obj.rectangle81:setStrokeSize(1);
    obj.rectangle81:setName("rectangle81");

    obj.habilidadesDisponivel = GUI.fromHandle(_obj_newObject("label"));
    obj.habilidadesDisponivel:setParent(obj.rectangle79);
    obj.habilidadesDisponivel:setLeft(270);
    obj.habilidadesDisponivel:setTop(5);
    obj.habilidadesDisponivel:setWidth(50);
    obj.habilidadesDisponivel:setHeight(25);
    obj.habilidadesDisponivel:setHorzTextAlign("center");
    obj.habilidadesDisponivel:setField("habilidadesDisponivel");
    obj.habilidadesDisponivel:setName("habilidadesDisponivel");

    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.rectangle79);
    obj.dataLink40:setFields({'habilidadesNivel','habilidadesDisponivel'});
    obj.dataLink40:setName("dataLink40");

    obj.rclHabilidades = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclHabilidades:setParent(obj.rectangle79);
    obj.rclHabilidades:setLeft(5);
    obj.rclHabilidades:setTop(30);
    obj.rclHabilidades:setWidth(455);
    obj.rclHabilidades:setHeight(645);
    obj.rclHabilidades:setName("rclHabilidades");
    obj.rclHabilidades:setField("listaDeHabilidades");
    obj.rclHabilidades:setTemplateForm("frmAbilities");
    obj.rclHabilidades:setLayout("vertical");
    obj.rclHabilidades:setMinQt(5);

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Inventário");
    obj.tab2:setName("tab2");

    obj.frmInventory = GUI.fromHandle(_obj_newObject("form"));
    obj.frmInventory:setParent(obj.tab2);
    obj.frmInventory:setName("frmInventory");
    obj.frmInventory:setAlign("client");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmInventory);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.rectangle82 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle82:setParent(obj.scrollBox2);
    obj.rectangle82:setLeft(0);
    obj.rectangle82:setTop(0);
    obj.rectangle82:setWidth(1210);
    obj.rectangle82:setHeight(225);
    obj.rectangle82:setColor("black");
    obj.rectangle82:setStrokeColor("white");
    obj.rectangle82:setStrokeSize(1);
    obj.rectangle82:setName("rectangle82");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle82);
    obj.layout28:setAlign("top");
    obj.layout28:setHeight(22);
    obj.layout28:setName("layout28");

    obj.label147 = GUI.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout28);
    obj.label147:setLeft(100);
    obj.label147:setTop(5);
    obj.label147:setWidth(300);
    obj.label147:setHeight(20);
    obj.label147:setHorzTextAlign("center");
    obj.label147:setText("Nome do Item Equipado");
    obj.label147:setName("label147");

    obj.label148 = GUI.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout28);
    obj.label148:setLeft(400);
    obj.label148:setTop(5);
    obj.label148:setWidth(40);
    obj.label148:setHeight(20);
    obj.label148:setHorzTextAlign("center");
    obj.label148:setText("Act");
    obj.label148:setName("label148");

    obj.label149 = GUI.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout28);
    obj.label149:setLeft(440);
    obj.label149:setTop(5);
    obj.label149:setWidth(255);
    obj.label149:setHeight(20);
    obj.label149:setHorzTextAlign("center");
    obj.label149:setText("Marca 1");
    obj.label149:setName("label149");

    obj.label150 = GUI.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout28);
    obj.label150:setLeft(695);
    obj.label150:setTop(5);
    obj.label150:setWidth(255);
    obj.label150:setHeight(20);
    obj.label150:setHorzTextAlign("center");
    obj.label150:setText("Marca 2");
    obj.label150:setName("label150");

    obj.label151 = GUI.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.layout28);
    obj.label151:setLeft(950);
    obj.label151:setTop(5);
    obj.label151:setWidth(255);
    obj.label151:setHeight(20);
    obj.label151:setHorzTextAlign("center");
    obj.label151:setText("Marca 3");
    obj.label151:setName("label151");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle82);
    obj.layout29:setAlign("top");
    obj.layout29:setHeight(50);
    obj.layout29:setName("layout29");

    obj.label152 = GUI.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout29);
    obj.label152:setLeft(5);
    obj.label152:setTop(15);
    obj.label152:setWidth(95);
    obj.label152:setHeight(20);
    obj.label152:setText("Primária");
    obj.label152:setHorzTextAlign("center");
    obj.label152:setName("label152");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout29);
    obj.edit64:setLeft(100);
    obj.edit64:setTop(0);
    obj.edit64:setWidth(300);
    obj.edit64:setHeight(25);
    obj.edit64:setField("equip_arma");
    obj.edit64:setVertTextAlign("center");
    obj.edit64:setName("edit64");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout29);
    obj.edit65:setLeft(400);
    obj.edit65:setTop(0);
    obj.edit65:setWidth(40);
    obj.edit65:setHeight(25);
    obj.edit65:setField("equip_arma_act");
    obj.edit65:setVertTextAlign("center");
    obj.edit65:setType("number");
    obj.edit65:setName("edit65");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout29);
    obj.edit66:setLeft(440);
    obj.edit66:setTop(0);
    obj.edit66:setWidth(255);
    obj.edit66:setHeight(25);
    obj.edit66:setField("equip_arma_marca1");
    obj.edit66:setVertTextAlign("center");
    obj.edit66:setName("edit66");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout29);
    obj.edit67:setLeft(695);
    obj.edit67:setTop(0);
    obj.edit67:setWidth(255);
    obj.edit67:setHeight(25);
    obj.edit67:setField("equip_arma_marca2");
    obj.edit67:setVertTextAlign("center");
    obj.edit67:setName("edit67");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout29);
    obj.edit68:setLeft(950);
    obj.edit68:setTop(0);
    obj.edit68:setWidth(255);
    obj.edit68:setHeight(25);
    obj.edit68:setField("equip_arma_marca3");
    obj.edit68:setVertTextAlign("center");
    obj.edit68:setName("edit68");

    obj.label153 = GUI.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.layout29);
    obj.label153:setLeft(100);
    obj.label153:setTop(30);
    obj.label153:setWidth(50);
    obj.label153:setHeight(20);
    obj.label153:setText("Efeito:");
    obj.label153:setHorzTextAlign("center");
    obj.label153:setName("label153");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout29);
    obj.edit69:setLeft(150);
    obj.edit69:setTop(25);
    obj.edit69:setWidth(1055);
    obj.edit69:setHeight(25);
    obj.edit69:setField("equip_arma_desc");
    obj.edit69:setVertTextAlign("center");
    obj.edit69:setName("edit69");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle82);
    obj.layout30:setAlign("top");
    obj.layout30:setHeight(50);
    obj.layout30:setName("layout30");

    obj.label154 = GUI.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout30);
    obj.label154:setLeft(5);
    obj.label154:setTop(15);
    obj.label154:setWidth(95);
    obj.label154:setHeight(20);
    obj.label154:setText("Secundária");
    obj.label154:setHorzTextAlign("center");
    obj.label154:setName("label154");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout30);
    obj.edit70:setLeft(100);
    obj.edit70:setTop(0);
    obj.edit70:setWidth(300);
    obj.edit70:setHeight(25);
    obj.edit70:setField("equip_arma2");
    obj.edit70:setVertTextAlign("center");
    obj.edit70:setName("edit70");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout30);
    obj.edit71:setLeft(400);
    obj.edit71:setTop(0);
    obj.edit71:setWidth(40);
    obj.edit71:setHeight(25);
    obj.edit71:setField("equip_arma2_act");
    obj.edit71:setVertTextAlign("center");
    obj.edit71:setType("number");
    obj.edit71:setName("edit71");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout30);
    obj.edit72:setLeft(440);
    obj.edit72:setTop(0);
    obj.edit72:setWidth(255);
    obj.edit72:setHeight(25);
    obj.edit72:setField("equip_arma2_marca1");
    obj.edit72:setVertTextAlign("center");
    obj.edit72:setName("edit72");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout30);
    obj.edit73:setLeft(695);
    obj.edit73:setTop(0);
    obj.edit73:setWidth(255);
    obj.edit73:setHeight(25);
    obj.edit73:setField("equip_arma2_marca2");
    obj.edit73:setVertTextAlign("center");
    obj.edit73:setName("edit73");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout30);
    obj.edit74:setLeft(950);
    obj.edit74:setTop(0);
    obj.edit74:setWidth(255);
    obj.edit74:setHeight(25);
    obj.edit74:setField("equip_arma2_marca3");
    obj.edit74:setVertTextAlign("center");
    obj.edit74:setName("edit74");

    obj.label155 = GUI.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.layout30);
    obj.label155:setLeft(100);
    obj.label155:setTop(30);
    obj.label155:setWidth(50);
    obj.label155:setHeight(20);
    obj.label155:setText("Efeito:");
    obj.label155:setHorzTextAlign("center");
    obj.label155:setName("label155");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout30);
    obj.edit75:setLeft(150);
    obj.edit75:setTop(25);
    obj.edit75:setWidth(1055);
    obj.edit75:setHeight(25);
    obj.edit75:setField("equip_arma2_desc");
    obj.edit75:setVertTextAlign("center");
    obj.edit75:setName("edit75");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle82);
    obj.layout31:setAlign("top");
    obj.layout31:setHeight(50);
    obj.layout31:setName("layout31");

    obj.label156 = GUI.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.layout31);
    obj.label156:setLeft(5);
    obj.label156:setTop(15);
    obj.label156:setWidth(95);
    obj.label156:setHeight(20);
    obj.label156:setText("Equipamento");
    obj.label156:setHorzTextAlign("center");
    obj.label156:setName("label156");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout31);
    obj.edit76:setLeft(100);
    obj.edit76:setTop(0);
    obj.edit76:setWidth(300);
    obj.edit76:setHeight(25);
    obj.edit76:setField("equip_equipamento");
    obj.edit76:setVertTextAlign("center");
    obj.edit76:setName("edit76");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout31);
    obj.edit77:setLeft(400);
    obj.edit77:setTop(0);
    obj.edit77:setWidth(40);
    obj.edit77:setHeight(25);
    obj.edit77:setField("equip_equipamento_act");
    obj.edit77:setVertTextAlign("center");
    obj.edit77:setType("number");
    obj.edit77:setName("edit77");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout31);
    obj.edit78:setLeft(440);
    obj.edit78:setTop(0);
    obj.edit78:setWidth(255);
    obj.edit78:setHeight(25);
    obj.edit78:setField("equip_equipamento_marca1");
    obj.edit78:setVertTextAlign("center");
    obj.edit78:setName("edit78");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout31);
    obj.edit79:setLeft(695);
    obj.edit79:setTop(0);
    obj.edit79:setWidth(255);
    obj.edit79:setHeight(25);
    obj.edit79:setField("equip_equipamento_marca2");
    obj.edit79:setVertTextAlign("center");
    obj.edit79:setName("edit79");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout31);
    obj.edit80:setLeft(950);
    obj.edit80:setTop(0);
    obj.edit80:setWidth(255);
    obj.edit80:setHeight(25);
    obj.edit80:setField("equip_equipamento_marca3");
    obj.edit80:setVertTextAlign("center");
    obj.edit80:setName("edit80");

    obj.label157 = GUI.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.layout31);
    obj.label157:setLeft(100);
    obj.label157:setTop(30);
    obj.label157:setWidth(50);
    obj.label157:setHeight(20);
    obj.label157:setText("Efeito:");
    obj.label157:setHorzTextAlign("center");
    obj.label157:setName("label157");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout31);
    obj.edit81:setLeft(150);
    obj.edit81:setTop(25);
    obj.edit81:setWidth(1055);
    obj.edit81:setHeight(25);
    obj.edit81:setField("equip_equipamento_desc");
    obj.edit81:setVertTextAlign("center");
    obj.edit81:setName("edit81");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle82);
    obj.layout32:setAlign("top");
    obj.layout32:setHeight(50);
    obj.layout32:setName("layout32");

    obj.label158 = GUI.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.layout32);
    obj.label158:setLeft(5);
    obj.label158:setTop(15);
    obj.label158:setWidth(95);
    obj.label158:setHeight(20);
    obj.label158:setText("Vestimenta");
    obj.label158:setHorzTextAlign("center");
    obj.label158:setName("label158");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout32);
    obj.edit82:setLeft(100);
    obj.edit82:setTop(0);
    obj.edit82:setWidth(300);
    obj.edit82:setHeight(25);
    obj.edit82:setField("equip_vestimenta");
    obj.edit82:setVertTextAlign("center");
    obj.edit82:setName("edit82");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout32);
    obj.edit83:setLeft(400);
    obj.edit83:setTop(0);
    obj.edit83:setWidth(40);
    obj.edit83:setHeight(25);
    obj.edit83:setField("equip_vestimenta_act");
    obj.edit83:setVertTextAlign("center");
    obj.edit83:setType("number");
    obj.edit83:setName("edit83");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout32);
    obj.edit84:setLeft(440);
    obj.edit84:setTop(0);
    obj.edit84:setWidth(255);
    obj.edit84:setHeight(25);
    obj.edit84:setField("equip_vestimenta_marca1");
    obj.edit84:setVertTextAlign("center");
    obj.edit84:setName("edit84");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout32);
    obj.edit85:setLeft(695);
    obj.edit85:setTop(0);
    obj.edit85:setWidth(255);
    obj.edit85:setHeight(25);
    obj.edit85:setField("equip_vestimenta_marca2");
    obj.edit85:setVertTextAlign("center");
    obj.edit85:setName("edit85");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout32);
    obj.edit86:setLeft(950);
    obj.edit86:setTop(0);
    obj.edit86:setWidth(255);
    obj.edit86:setHeight(25);
    obj.edit86:setField("equip_vestimenta_marca3");
    obj.edit86:setVertTextAlign("center");
    obj.edit86:setName("edit86");

    obj.label159 = GUI.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.layout32);
    obj.label159:setLeft(100);
    obj.label159:setTop(30);
    obj.label159:setWidth(50);
    obj.label159:setHeight(20);
    obj.label159:setText("Efeito:");
    obj.label159:setHorzTextAlign("center");
    obj.label159:setName("label159");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout32);
    obj.edit87:setLeft(150);
    obj.edit87:setTop(25);
    obj.edit87:setWidth(1055);
    obj.edit87:setHeight(25);
    obj.edit87:setField("equip_vestimenta_desc");
    obj.edit87:setVertTextAlign("center");
    obj.edit87:setName("edit87");

    obj.rectangle83 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle83:setParent(obj.scrollBox2);
    obj.rectangle83:setLeft(0);
    obj.rectangle83:setTop(230);
    obj.rectangle83:setWidth(1210);
    obj.rectangle83:setHeight(35);
    obj.rectangle83:setColor("black");
    obj.rectangle83:setStrokeColor("white");
    obj.rectangle83:setStrokeSize(1);
    obj.rectangle83:setName("rectangle83");

    obj.label160 = GUI.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.rectangle83);
    obj.label160:setLeft(5);
    obj.label160:setTop(5);
    obj.label160:setWidth(295);
    obj.label160:setHeight(25);
    obj.label160:setHorzTextAlign("center");
    obj.label160:setText("Armazenamento");
    obj.label160:setName("label160");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.rectangle83);
    obj.comboBox3:setLeft(305);
    obj.comboBox3:setTop(5);
    obj.comboBox3:setWidth(295);
    obj.comboBox3:setHeight(25);
    obj.comboBox3:setField("armazenamento1");
    obj.comboBox3:setItems({'', 'Coldre Pequeno', 'Coldre Grande'});
    obj.comboBox3:setValues({'0','3','6'});
    obj.comboBox3:setName("comboBox3");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.rectangle83);
    obj.comboBox4:setLeft(605);
    obj.comboBox4:setTop(5);
    obj.comboBox4:setWidth(295);
    obj.comboBox4:setHeight(25);
    obj.comboBox4:setField("armazenamento2");
    obj.comboBox4:setItems({'', 'Coldre Pequeno', 'Coldre Grande'});
    obj.comboBox4:setValues({'0','3','6'});
    obj.comboBox4:setName("comboBox4");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.rectangle83);
    obj.comboBox5:setLeft(905);
    obj.comboBox5:setTop(5);
    obj.comboBox5:setWidth(295);
    obj.comboBox5:setHeight(25);
    obj.comboBox5:setField("armazenamento3");
    obj.comboBox5:setItems({'+0', '+1', '+2', '+3', '+4', '+5', '+6'});
    obj.comboBox5:setValues({'0','1','2','3','4','5','6'});
    obj.comboBox5:setName("comboBox5");

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.rectangle83);
    obj.dataLink41:setFields({'armazenamento1','armazenamento2','armazenamento3'});
    obj.dataLink41:setName("dataLink41");

    obj.rectangle84 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle84:setParent(obj.scrollBox2);
    obj.rectangle84:setLeft(0);
    obj.rectangle84:setTop(270);
    obj.rectangle84:setWidth(1210);
    obj.rectangle84:setHeight(460);
    obj.rectangle84:setColor("black");
    obj.rectangle84:setStrokeColor("white");
    obj.rectangle84:setStrokeSize(1);
    obj.rectangle84:setName("rectangle84");

    obj.label161 = GUI.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.rectangle84);
    obj.label161:setLeft(5);
    obj.label161:setTop(5);
    obj.label161:setWidth(200);
    obj.label161:setHeight(25);
    obj.label161:setHorzTextAlign("center");
    obj.label161:setText("Itens Guardados");
    obj.label161:setName("label161");

    obj.label162 = GUI.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.rectangle84);
    obj.label162:setLeft(205);
    obj.label162:setTop(5);
    obj.label162:setWidth(700);
    obj.label162:setHeight(25);
    obj.label162:setHorzTextAlign("center");
    obj.label162:setText("Efeitos Adicionais");
    obj.label162:setName("label162");

    obj.label163 = GUI.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.rectangle84);
    obj.label163:setLeft(905);
    obj.label163:setTop(5);
    obj.label163:setWidth(150);
    obj.label163:setHeight(25);
    obj.label163:setHorzTextAlign("center");
    obj.label163:setText("Tipo");
    obj.label163:setName("label163");

    obj.label164 = GUI.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.rectangle84);
    obj.label164:setLeft(1055);
    obj.label164:setTop(5);
    obj.label164:setWidth(50);
    obj.label164:setHeight(25);
    obj.label164:setHorzTextAlign("center");
    obj.label164:setText("Qtd");
    obj.label164:setName("label164");

    obj.label165 = GUI.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.rectangle84);
    obj.label165:setLeft(1105);
    obj.label165:setTop(5);
    obj.label165:setWidth(50);
    obj.label165:setHeight(25);
    obj.label165:setHorzTextAlign("center");
    obj.label165:setText("Max");
    obj.label165:setName("label165");

    obj.rclInventario = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclInventario:setParent(obj.rectangle84);
    obj.rclInventario:setLeft(5);
    obj.rclInventario:setTop(30);
    obj.rclInventario:setWidth(1200);
    obj.rclInventario:setHeight(425);
    obj.rclInventario:setName("rclInventario");
    obj.rclInventario:setField("listaDeItens");
    obj.rclInventario:setTemplateForm("frmItem");
    obj.rclInventario:setLayout("vertical");
    obj.rclInventario:setMinQt(10);

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Descrição");
    obj.tab3:setName("tab3");

    obj.frmTemplateDescription = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateDescription:setParent(obj.tab3);
    obj.frmTemplateDescription:setName("frmTemplateDescription");
    obj.frmTemplateDescription:setAlign("client");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmTemplateDescription);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.rectangle85 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle85:setParent(obj.scrollBox3);
    obj.rectangle85:setLeft(0);
    obj.rectangle85:setTop(0);
    obj.rectangle85:setWidth(1205);
    obj.rectangle85:setHeight(105);
    obj.rectangle85:setColor("black");
    obj.rectangle85:setName("rectangle85");

    obj.label166 = GUI.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.rectangle85);
    obj.label166:setLeft(3);
    obj.label166:setTop(1);
    obj.label166:setWidth(100);
    obj.label166:setHeight(20);
    obj.label166:setText("DESCRIÇÃO");
    obj.label166:setName("label166");

    obj.label167 = GUI.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.rectangle85);
    obj.label167:setLeft(10);
    obj.label167:setTop(25);
    obj.label167:setWidth(90);
    obj.label167:setHeight(20);
    obj.label167:setText("TAMANHO");
    obj.label167:setHorzTextAlign("center");
    obj.label167:setName("label167");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.rectangle85);
    obj.edit88:setLeft(100);
    obj.edit88:setTop(25);
    obj.edit88:setWidth(200);
    obj.edit88:setHeight(25);
    obj.edit88:setField("tamanho");
    obj.edit88:setVertTextAlign("center");
    obj.edit88:setName("edit88");

    obj.label168 = GUI.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.rectangle85);
    obj.label168:setLeft(10);
    obj.label168:setTop(50);
    obj.label168:setWidth(90);
    obj.label168:setHeight(20);
    obj.label168:setText("ALTURA");
    obj.label168:setHorzTextAlign("center");
    obj.label168:setName("label168");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.rectangle85);
    obj.edit89:setLeft(100);
    obj.edit89:setTop(50);
    obj.edit89:setWidth(200);
    obj.edit89:setHeight(25);
    obj.edit89:setField("altura");
    obj.edit89:setVertTextAlign("center");
    obj.edit89:setName("edit89");

    obj.label169 = GUI.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.rectangle85);
    obj.label169:setLeft(10);
    obj.label169:setTop(75);
    obj.label169:setWidth(90);
    obj.label169:setHeight(20);
    obj.label169:setText("PESO");
    obj.label169:setHorzTextAlign("center");
    obj.label169:setName("label169");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.rectangle85);
    obj.edit90:setLeft(100);
    obj.edit90:setTop(75);
    obj.edit90:setWidth(200);
    obj.edit90:setHeight(25);
    obj.edit90:setField("peso");
    obj.edit90:setVertTextAlign("center");
    obj.edit90:setName("edit90");

    obj.label170 = GUI.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.rectangle85);
    obj.label170:setLeft(310);
    obj.label170:setTop(25);
    obj.label170:setWidth(90);
    obj.label170:setHeight(20);
    obj.label170:setText("IDADE");
    obj.label170:setHorzTextAlign("center");
    obj.label170:setName("label170");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.rectangle85);
    obj.edit91:setLeft(400);
    obj.edit91:setTop(25);
    obj.edit91:setWidth(200);
    obj.edit91:setHeight(25);
    obj.edit91:setField("idade");
    obj.edit91:setVertTextAlign("center");
    obj.edit91:setName("edit91");

    obj.label171 = GUI.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.rectangle85);
    obj.label171:setLeft(310);
    obj.label171:setTop(50);
    obj.label171:setWidth(90);
    obj.label171:setHeight(20);
    obj.label171:setText("SEXO");
    obj.label171:setHorzTextAlign("center");
    obj.label171:setName("label171");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.rectangle85);
    obj.edit92:setLeft(400);
    obj.edit92:setTop(50);
    obj.edit92:setWidth(200);
    obj.edit92:setHeight(25);
    obj.edit92:setField("sexo");
    obj.edit92:setVertTextAlign("center");
    obj.edit92:setName("edit92");

    obj.label172 = GUI.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.rectangle85);
    obj.label172:setLeft(310);
    obj.label172:setTop(75);
    obj.label172:setWidth(90);
    obj.label172:setHeight(20);
    obj.label172:setText("OUTROS");
    obj.label172:setHorzTextAlign("center");
    obj.label172:setName("label172");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.rectangle85);
    obj.edit93:setLeft(400);
    obj.edit93:setTop(75);
    obj.edit93:setWidth(200);
    obj.edit93:setHeight(25);
    obj.edit93:setField("aparenciaOutros");
    obj.edit93:setVertTextAlign("center");
    obj.edit93:setName("edit93");

    obj.label173 = GUI.fromHandle(_obj_newObject("label"));
    obj.label173:setParent(obj.rectangle85);
    obj.label173:setLeft(610);
    obj.label173:setTop(25);
    obj.label173:setWidth(90);
    obj.label173:setHeight(20);
    obj.label173:setText("OLHOS");
    obj.label173:setHorzTextAlign("center");
    obj.label173:setName("label173");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.rectangle85);
    obj.edit94:setLeft(700);
    obj.edit94:setTop(25);
    obj.edit94:setWidth(200);
    obj.edit94:setHeight(25);
    obj.edit94:setField("aparenciaOlhos");
    obj.edit94:setVertTextAlign("center");
    obj.edit94:setName("edit94");

    obj.label174 = GUI.fromHandle(_obj_newObject("label"));
    obj.label174:setParent(obj.rectangle85);
    obj.label174:setLeft(610);
    obj.label174:setTop(50);
    obj.label174:setWidth(90);
    obj.label174:setHeight(20);
    obj.label174:setText("PELE");
    obj.label174:setHorzTextAlign("center");
    obj.label174:setName("label174");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.rectangle85);
    obj.edit95:setLeft(700);
    obj.edit95:setTop(50);
    obj.edit95:setWidth(200);
    obj.edit95:setHeight(25);
    obj.edit95:setField("pele");
    obj.edit95:setVertTextAlign("center");
    obj.edit95:setName("edit95");

    obj.label175 = GUI.fromHandle(_obj_newObject("label"));
    obj.label175:setParent(obj.rectangle85);
    obj.label175:setLeft(610);
    obj.label175:setTop(75);
    obj.label175:setWidth(90);
    obj.label175:setHeight(20);
    obj.label175:setText("CABELO");
    obj.label175:setHorzTextAlign("center");
    obj.label175:setName("label175");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.rectangle85);
    obj.edit96:setLeft(700);
    obj.edit96:setTop(75);
    obj.edit96:setWidth(200);
    obj.edit96:setHeight(25);
    obj.edit96:setField("cabelo");
    obj.edit96:setVertTextAlign("center");
    obj.edit96:setName("edit96");

    obj.label176 = GUI.fromHandle(_obj_newObject("label"));
    obj.label176:setParent(obj.rectangle85);
    obj.label176:setLeft(910);
    obj.label176:setTop(25);
    obj.label176:setWidth(90);
    obj.label176:setHeight(20);
    obj.label176:setText("TATOO");
    obj.label176:setHorzTextAlign("center");
    obj.label176:setName("label176");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.rectangle85);
    obj.edit97:setLeft(1000);
    obj.edit97:setTop(25);
    obj.edit97:setWidth(200);
    obj.edit97:setHeight(25);
    obj.edit97:setField("plano");
    obj.edit97:setVertTextAlign("center");
    obj.edit97:setName("edit97");

    obj.label177 = GUI.fromHandle(_obj_newObject("label"));
    obj.label177:setParent(obj.rectangle85);
    obj.label177:setLeft(910);
    obj.label177:setTop(50);
    obj.label177:setWidth(90);
    obj.label177:setHeight(20);
    obj.label177:setText("CICATRIZES");
    obj.label177:setHorzTextAlign("center");
    obj.label177:setName("label177");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.rectangle85);
    obj.edit98:setLeft(1000);
    obj.edit98:setTop(50);
    obj.edit98:setWidth(200);
    obj.edit98:setHeight(25);
    obj.edit98:setField("regiao");
    obj.edit98:setVertTextAlign("center");
    obj.edit98:setName("edit98");

    obj.label178 = GUI.fromHandle(_obj_newObject("label"));
    obj.label178:setParent(obj.rectangle85);
    obj.label178:setLeft(910);
    obj.label178:setTop(75);
    obj.label178:setWidth(90);
    obj.label178:setHeight(20);
    obj.label178:setText("ETNIA");
    obj.label178:setHorzTextAlign("center");
    obj.label178:setName("label178");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.rectangle85);
    obj.edit99:setLeft(1000);
    obj.edit99:setTop(75);
    obj.edit99:setWidth(200);
    obj.edit99:setHeight(25);
    obj.edit99:setField("reino");
    obj.edit99:setVertTextAlign("center");
    obj.edit99:setName("edit99");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.scrollBox3);
    obj.layout33:setLeft(0);
    obj.layout33:setTop(110);
    obj.layout33:setWidth(375);
    obj.layout33:setHeight(495);
    obj.layout33:setName("layout33");

    obj.rectangle86 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle86:setParent(obj.layout33);
    obj.rectangle86:setAlign("client");
    obj.rectangle86:setColor("black");
    obj.rectangle86:setName("rectangle86");

    obj.label179 = GUI.fromHandle(_obj_newObject("label"));
    obj.label179:setParent(obj.layout33);
    obj.label179:setLeft(5);
    obj.label179:setTop(1);
    obj.label179:setWidth(365);
    obj.label179:setHeight(20);
    obj.label179:setText("TÉCNICAS & FEITIÇOS");
    obj.label179:setName("label179");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout33);
    obj.textEditor2:setLeft(5);
    obj.textEditor2:setTop(25);
    obj.textEditor2:setWidth(365);
    obj.textEditor2:setHeight(465);
    obj.textEditor2:setField("personalidade");
    obj.textEditor2:setName("textEditor2");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.scrollBox3);
    obj.layout34:setLeft(380);
    obj.layout34:setTop(110);
    obj.layout34:setWidth(825);
    obj.layout34:setHeight(495);
    obj.layout34:setName("layout34");

    obj.rectangle87 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle87:setParent(obj.layout34);
    obj.rectangle87:setAlign("client");
    obj.rectangle87:setColor("black");
    obj.rectangle87:setName("rectangle87");

    obj.label180 = GUI.fromHandle(_obj_newObject("label"));
    obj.label180:setParent(obj.layout34);
    obj.label180:setLeft(5);
    obj.label180:setTop(1);
    obj.label180:setWidth(100);
    obj.label180:setHeight(20);
    obj.label180:setText("PRE-MORTEM");
    obj.label180:setName("label180");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout34);
    obj.richEdit1:setLeft(5);
    obj.richEdit1:setTop(25);
    obj.richEdit1:setWidth(815);
    obj.richEdit1:setHeight(465);
    obj.richEdit1:setField("background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Anotações");
    obj.tab4:setName("tab4");

    obj.frmTemplateNotes = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateNotes:setParent(obj.tab4);
    obj.frmTemplateNotes:setName("frmTemplateNotes");
    obj.frmTemplateNotes:setAlign("client");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmTemplateNotes);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.scrollBox4);
    obj.layout35:setLeft(0);
    obj.layout35:setTop(0);
    obj.layout35:setWidth(400);
    obj.layout35:setHeight(580);
    obj.layout35:setName("layout35");

    obj.rectangle88 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle88:setParent(obj.layout35);
    obj.rectangle88:setLeft(0);
    obj.rectangle88:setTop(0);
    obj.rectangle88:setWidth(400);
    obj.rectangle88:setHeight(580);
    obj.rectangle88:setColor("black");
    obj.rectangle88:setXradius(5);
    obj.rectangle88:setYradius(15);
    obj.rectangle88:setCornerType("round");
    obj.rectangle88:setName("rectangle88");

    obj.label181 = GUI.fromHandle(_obj_newObject("label"));
    obj.label181:setParent(obj.layout35);
    obj.label181:setLeft(0);
    obj.label181:setTop(0);
    obj.label181:setWidth(400);
    obj.label181:setHeight(20);
    obj.label181:setText("Anotações Gerais");
    obj.label181:setHorzTextAlign("center");
    obj.label181:setName("label181");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout35);
    obj.textEditor3:setLeft(10);
    obj.textEditor3:setTop(25);
    obj.textEditor3:setWidth(380);
    obj.textEditor3:setHeight(540);
    obj.textEditor3:setField("anotacoes1");
    obj.textEditor3:setName("textEditor3");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.scrollBox4);
    obj.layout36:setLeft(410);
    obj.layout36:setTop(0);
    obj.layout36:setWidth(400);
    obj.layout36:setHeight(580);
    obj.layout36:setName("layout36");

    obj.rectangle89 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle89:setParent(obj.layout36);
    obj.rectangle89:setLeft(0);
    obj.rectangle89:setTop(0);
    obj.rectangle89:setWidth(400);
    obj.rectangle89:setHeight(580);
    obj.rectangle89:setColor("black");
    obj.rectangle89:setXradius(5);
    obj.rectangle89:setYradius(15);
    obj.rectangle89:setCornerType("round");
    obj.rectangle89:setName("rectangle89");

    obj.label182 = GUI.fromHandle(_obj_newObject("label"));
    obj.label182:setParent(obj.layout36);
    obj.label182:setLeft(0);
    obj.label182:setTop(0);
    obj.label182:setWidth(400);
    obj.label182:setHeight(20);
    obj.label182:setText("Tarefas");
    obj.label182:setHorzTextAlign("center");
    obj.label182:setName("label182");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout36);
    obj.textEditor4:setLeft(10);
    obj.textEditor4:setTop(25);
    obj.textEditor4:setWidth(380);
    obj.textEditor4:setHeight(540);
    obj.textEditor4:setField("anotacoes2");
    obj.textEditor4:setName("textEditor4");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.scrollBox4);
    obj.layout37:setLeft(820);
    obj.layout37:setTop(0);
    obj.layout37:setWidth(400);
    obj.layout37:setHeight(580);
    obj.layout37:setName("layout37");

    obj.rectangle90 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle90:setParent(obj.layout37);
    obj.rectangle90:setLeft(0);
    obj.rectangle90:setTop(0);
    obj.rectangle90:setWidth(400);
    obj.rectangle90:setHeight(580);
    obj.rectangle90:setColor("black");
    obj.rectangle90:setXradius(5);
    obj.rectangle90:setYradius(15);
    obj.rectangle90:setCornerType("round");
    obj.rectangle90:setName("rectangle90");

    obj.label183 = GUI.fromHandle(_obj_newObject("label"));
    obj.label183:setParent(obj.layout37);
    obj.label183:setLeft(0);
    obj.label183:setTop(0);
    obj.label183:setWidth(400);
    obj.label183:setHeight(20);
    obj.label183:setText("Diário da Irmandade");
    obj.label183:setHorzTextAlign("center");
    obj.label183:setName("label183");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout37);
    obj.textEditor5:setLeft(10);
    obj.textEditor5:setTop(25);
    obj.textEditor5:setWidth(380);
    obj.textEditor5:setHeight(540);
    obj.textEditor5:setField("anotacoes3");
    obj.textEditor5:setName("textEditor5");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Creditos");
    obj.tab5:setName("tab5");

    obj.frmTemplateCreditos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateCreditos:setParent(obj.tab5);
    obj.frmTemplateCreditos:setName("frmTemplateCreditos");
    obj.frmTemplateCreditos:setAlign("client");


			local function recursiveFindControls(node, controlsList)
				local children = node:getChildren();
				for i=1, #children, 1 do
					controlsList[#controlsList+1] = children[i];
					recursiveFindControls(children[i], controlsList);
				end;
			end;

			local function findAllControls()
				local controlsList = {self};
				recursiveFindControls(self, controlsList);
				
				return controlsList;
			end;

			local function filterByClass(className, controls)
				local controlsFromClass = {};

				for i=1, #controls, 1 do
					if controls[i]:getClassName() == className then
						controlsFromClass[#controlsFromClass + 1] = controls[i];
					end;
				end;

				return controlsFromClass;
			end;

			local function findClass(className)
				local controls = findAllControls();
				return filterByClass(className, controls);
			end;

		


    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmTemplateCreditos);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox5);
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(500);
    obj.image2:setHeight(500);
    obj.image2:setStyle("autoFit");
    obj.image2:setSRC("logo");
    obj.image2:setName("image2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox5);
    obj.image3:setLeft(550);
    obj.image3:setTop(0);
    obj.image3:setWidth(250);
    obj.image3:setHeight(250);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("/TheMaze/images/RPGmeister.jpg");
    obj.image3:setName("image3");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.scrollBox5);
    obj.layout38:setLeft(850);
    obj.layout38:setTop(0);
    obj.layout38:setWidth(200);
    obj.layout38:setHeight(160);
    obj.layout38:setName("layout38");

    obj.rectangle91 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle91:setParent(obj.layout38);
    obj.rectangle91:setAlign("client");
    obj.rectangle91:setColor("black");
    obj.rectangle91:setXradius(5);
    obj.rectangle91:setYradius(15);
    obj.rectangle91:setCornerType("round");
    obj.rectangle91:setName("rectangle91");

    obj.label184 = GUI.fromHandle(_obj_newObject("label"));
    obj.label184:setParent(obj.layout38);
    obj.label184:setLeft(0);
    obj.label184:setTop(10);
    obj.label184:setWidth(200);
    obj.label184:setHeight(20);
    obj.label184:setText("Programado por: ");
    obj.label184:setHorzTextAlign("center");
    obj.label184:setName("label184");

    obj.label185 = GUI.fromHandle(_obj_newObject("label"));
    obj.label185:setParent(obj.layout38);
    obj.label185:setLeft(0);
    obj.label185:setTop(35);
    obj.label185:setWidth(200);
    obj.label185:setHeight(20);
    obj.label185:setText("Vinny (Ambesek)");
    obj.label185:setHorzTextAlign("center");
    obj.label185:setName("label185");

    obj.label186 = GUI.fromHandle(_obj_newObject("label"));
    obj.label186:setParent(obj.layout38);
    obj.label186:setLeft(0);
    obj.label186:setTop(60);
    obj.label186:setWidth(200);
    obj.label186:setHeight(20);
    obj.label186:setText("Consultor: Yagorok");
    obj.label186:setHorzTextAlign("center");
    obj.label186:setName("label186");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.scrollBox5);
    obj.layout39:setLeft(850);
    obj.layout39:setTop(200);
    obj.layout39:setWidth(200);
    obj.layout39:setHeight(150);
    obj.layout39:setName("layout39");

    obj.rectangle92 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle92:setParent(obj.layout39);
    obj.rectangle92:setLeft(0);
    obj.rectangle92:setTop(0);
    obj.rectangle92:setWidth(200);
    obj.rectangle92:setHeight(150);
    obj.rectangle92:setColor("black");
    obj.rectangle92:setName("rectangle92");

    obj.label187 = GUI.fromHandle(_obj_newObject("label"));
    obj.label187:setParent(obj.layout39);
    obj.label187:setLeft(0);
    obj.label187:setTop(10);
    obj.label187:setWidth(80);
    obj.label187:setHeight(20);
    obj.label187:setText("Tema:");
    obj.label187:setHorzTextAlign("center");
    obj.label187:setName("label187");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout39);
    obj.comboBox6:setLeft(95);
    obj.comboBox6:setTop(10);
    obj.comboBox6:setWidth(90);
    obj.comboBox6:setField("theme");
    obj.comboBox6:setFontColor("white");
    obj.comboBox6:setItems({'Escuro', 'Claro'});
    obj.comboBox6:setHorzTextAlign("center");
    obj.comboBox6:setName("comboBox6");

    obj.dataLink42 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.layout39);
    obj.dataLink42:setField("theme");
    obj.dataLink42:setDefaultValue("Escuro");
    obj.dataLink42:setName("dataLink42");

    obj.label188 = GUI.fromHandle(_obj_newObject("label"));
    obj.label188:setParent(obj.layout39);
    obj.label188:setLeft(0);
    obj.label188:setTop(35);
    obj.label188:setWidth(90);
    obj.label188:setHeight(20);
    obj.label188:setText("Cores: ");
    obj.label188:setHorzTextAlign("center");
    obj.label188:setName("label188");

    obj.label189 = GUI.fromHandle(_obj_newObject("label"));
    obj.label189:setParent(obj.layout39);
    obj.label189:setLeft(0);
    obj.label189:setTop(60);
    obj.label189:setWidth(90);
    obj.label189:setHeight(20);
    obj.label189:setText("Fundo ");
    obj.label189:setHorzTextAlign("center");
    obj.label189:setName("label189");

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.layout39);
    obj.comboBox7:setLeft(95);
    obj.comboBox7:setTop(60);
    obj.comboBox7:setWidth(90);
    obj.comboBox7:setField("colorBackground");
    obj.comboBox7:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox7:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox7:setName("comboBox7");

    obj.dataLink43 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.layout39);
    obj.dataLink43:setField("colorBackground");
    obj.dataLink43:setDefaultValue("#000000");
    obj.dataLink43:setName("dataLink43");

    obj.label190 = GUI.fromHandle(_obj_newObject("label"));
    obj.label190:setParent(obj.layout39);
    obj.label190:setLeft(0);
    obj.label190:setTop(85);
    obj.label190:setWidth(90);
    obj.label190:setHeight(20);
    obj.label190:setText("Linhas ");
    obj.label190:setHorzTextAlign("center");
    obj.label190:setName("label190");

    obj.comboBox8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.layout39);
    obj.comboBox8:setLeft(95);
    obj.comboBox8:setTop(85);
    obj.comboBox8:setWidth(90);
    obj.comboBox8:setField("colorStroke");
    obj.comboBox8:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox8:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox8:setName("comboBox8");

    obj.dataLink44 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.layout39);
    obj.dataLink44:setField("colorStroke");
    obj.dataLink44:setDefaultValue("#FFFFFF");
    obj.dataLink44:setName("dataLink44");

    obj.label191 = GUI.fromHandle(_obj_newObject("label"));
    obj.label191:setParent(obj.layout39);
    obj.label191:setLeft(0);
    obj.label191:setTop(110);
    obj.label191:setWidth(90);
    obj.label191:setHeight(20);
    obj.label191:setText("Fonte ");
    obj.label191:setHorzTextAlign("center");
    obj.label191:setName("label191");

    obj.comboBox9 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.layout39);
    obj.comboBox9:setLeft(95);
    obj.comboBox9:setTop(110);
    obj.comboBox9:setWidth(90);
    obj.comboBox9:setField("colorFont");
    obj.comboBox9:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox9:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox9:setName("comboBox9");

    obj.dataLink45 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.layout39);
    obj.dataLink45:setField("colorFont");
    obj.dataLink45:setDefaultValue("#FFFFFF");
    obj.dataLink45:setName("dataLink45");

    obj.label192 = GUI.fromHandle(_obj_newObject("label"));
    obj.label192:setParent(obj.scrollBox5);
    obj.label192:setLeft(555);
    obj.label192:setTop(275);
    obj.label192:setWidth(200);
    obj.label192:setHeight(20);
    obj.label192:setText("Versão Atual: ");
    obj.label192:setHorzTextAlign("center");
    obj.label192:setField("versionInstalled");
    obj.label192:setName("label192");

    obj.label193 = GUI.fromHandle(_obj_newObject("label"));
    obj.label193:setParent(obj.scrollBox5);
    obj.label193:setLeft(555);
    obj.label193:setTop(300);
    obj.label193:setWidth(200);
    obj.label193:setHeight(20);
    obj.label193:setText("Sua Versão: ");
    obj.label193:setHorzTextAlign("center");
    obj.label193:setField("versionDownloaded");
    obj.label193:setName("label193");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.scrollBox5);
    obj.checkBox1:setLeft(555);
    obj.checkBox1:setTop(325);
    obj.checkBox1:setWidth(200);
    obj.checkBox1:setHeight(20);
    obj.checkBox1:setField("noUpdate");
    obj.checkBox1:setText("Não pedir para atualizar.");
    obj.checkBox1:setName("checkBox1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox5);
    obj.button1:setLeft(555);
    obj.button1:setTop(350);
    obj.button1:setWidth(100);
    obj.button1:setText("Change Log");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox5);
    obj.button2:setLeft(667);
    obj.button2:setTop(350);
    obj.button2:setWidth(100);
    obj.button2:setText("Atualizar");
    obj.button2:setName("button2");

    obj.label194 = GUI.fromHandle(_obj_newObject("label"));
    obj.label194:setParent(obj.scrollBox5);
    obj.label194:setLeft(555);
    obj.label194:setTop(400);
    obj.label194:setWidth(200);
    obj.label194:setHeight(20);
    obj.label194:setText("Conheça as Mesas:");
    obj.label194:setName("label194");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox5);
    obj.button3:setLeft(555);
    obj.button3:setTop(425);
    obj.button3:setWidth(100);
    obj.button3:setText("RPGmeister");
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.scrollBox5);
    obj.button4:setLeft(667);
    obj.button4:setTop(425);
    obj.button4:setWidth(125);
    obj.button4:setText("RPG The Maze");
    obj.button4:setName("button4");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            Internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20The%20Maze/output/Ficha%20The%20Maze.rpk?raw=true",
                        function(stream, contentType)
                            local info = Firecast.Plugins.getRPKDetails(stream);
                            sheet.versionDownloaded = "VERSÃO DISPONÍVEL: " .. info.version;
            
                            local installed = Firecast.Plugins.getInstalledPlugins();
                            local myself;
                            for i=1, #installed, 1 do
                                if installed[i].moduleId == info.moduleId then
                                    myself = installed[i];
                                    sheet.versionInstalled = "VERSÃO INSTALADA: " .. installed[i].version;
                                end;
                            end;
            
                            if sheet.noUpdate==true then return end;
                            if myself~= nil and isNewVersion(myself.version, info.version) then
                                Dialogs.choose("Há uma nova versão (" .. info.version .. ") desse plugin. Deseja instalar?",{"Sim", "Não", "Não perguntar novamente."},
                                    function(selected, selectedIndex, selectedText)
                                        if selected and selectedIndex == 1 then
                                            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20The%20Maze/output/Ficha%20The%20Maze.rpk?raw=true');
                                        elseif selected and selectedIndex == 3 then
                                            sheet.noUpdate = true;
                                        end;
                                    end);
                            end;
                        end,       
                        function (errorMsg)
                            --showMessage(errorMsg);
                        end,       
                        function (downloaded, total)
                            -- esta função será chamada constantemente.
                            -- dividir "downloaded" por "total" lhe dará uma porcentagem do download.
                        end, "checkForModification");
        end, obj);

    obj._e_event1 = obj.edit2:addEventListener("onChange",
        function (_)
            if sheet==nil then return end;
            					local mod = (tonumber(sheet.experiencia) or 0);
            					local mod2 = 0;
            					local mod3 = 0;
            					while mod>=mod2 do
            						mod3 = mod3+1;
            						mod2 = mod2 + mod3*5;
            					end
            
            					sheet.nivel = mod3;
        end, obj);

    obj._e_event2 = obj.edit3:addEventListener("onChange",
        function (_)
            if sheet==nil then return end;
            					local mod = (tonumber(sheet.progresso) or 0);
            					local mod2 = 0;
            					local mod3 = 0;
            					while mod>=mod2 do
            						mod3 = mod3+1;
            						mod2 = mod2 + mod3*5;
            					end
            
            					sheet.rank = mod3;
        end, obj);

    obj._e_event3 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local nivel = (tonumber(sheet.nivel) or 0);
            					sheet.vidaBase = 360 + (nivel * 40);
            					sheet.fadigaBase = 90 + (nivel * 10);
            					sheet.imersaoBase = 10 + (nivel * 5);
            					sheet.atr_max = 44 + (nivel * 4);
            					sheet.habilidadesDisponivel = math.min(nivel*2 + 1, 25);
        end, obj);

    obj._e_event4 = obj.image1:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event5 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local nivel = (tonumber(sheet.agilidade_nivel) or 0);
            				local total = 	nivel + (tonumber(sheet.agilidade_outros) or 0);
            				sheet.agilidade_total = total;
            				local txt = "D (+0)";
            				if nivel > 43 then
            					txt = "S (+8)";
            				elseif nivel > 29 then
            					txt = "A (+6)";
            				elseif nivel > 17 then
            					txt = "B (+4)";
            				elseif nivel > 7 then
            					txt = "C (+2)";
            				end;
            				sheet.agilidade_pericia = txt;
        end, obj);

    obj._e_event6 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local nivel = (tonumber(sheet.cac_nivel) or 0);
            				local total = 	nivel + (tonumber(sheet.cac_outros) or 0);
            				sheet.cac_total = total;
            				local txt = "D (+0)";
            				if nivel > 43 then
            					txt = "S (+8)";
            				elseif nivel > 29 then
            					txt = "A (+6)";
            				elseif nivel > 17 then
            					txt = "B (+4)";
            				elseif nivel > 7 then
            					txt = "C (+2)";
            				end;
            				sheet.cac_pericia = txt;
        end, obj);

    obj._e_event7 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local nivel = (tonumber(sheet.manuseio_nivel) or 0);
            				local total = 	nivel + (tonumber(sheet.manuseio_outros) or 0);
            				sheet.manuseio_total = total;
            				local txt = "D (+0)";
            				if nivel > 43 then
            					txt = "S (+8)";
            				elseif nivel > 29 then
            					txt = "A (+6)";
            				elseif nivel > 17 then
            					txt = "B (+4)";
            				elseif nivel > 7 then
            					txt = "C (+2)";
            				end;
            				sheet.manuseio_pericia = txt;
        end, obj);

    obj._e_event8 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local nivel = (tonumber(sheet.pontaria_nivel) or 0);
            				local total = 	nivel + (tonumber(sheet.pontaria_outros) or 0);
            				sheet.pontaria_total = total;
            				local txt = "D (+0)";
            				if nivel > 43 then
            					txt = "S (+8)";
            				elseif nivel > 29 then
            					txt = "A (+6)";
            				elseif nivel > 17 then
            					txt = "B (+4)";
            				elseif nivel > 7 then
            					txt = "C (+2)";
            				end;
            				sheet.pontaria_pericia = txt;
        end, obj);

    obj._e_event9 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local nivel = (tonumber(sheet.paranormalidade_nivel) or 0);
            				local total = 	nivel + (tonumber(sheet.paranormalidade_outros) or 0);
            				sheet.paranormalidade_total = total;
            				local txt = "D (+0)";
            				if nivel > 43 then
            					txt = "S (+8)";
            				elseif nivel > 29 then
            					txt = "A (+6)";
            				elseif nivel > 17 then
            					txt = "B (+4)";
            				elseif nivel > 7 then
            					txt = "C (+2)";
            				end;
            				sheet.paranormalidade_pericia = txt;
        end, obj);

    obj._e_event10 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local nivel = (tonumber(sheet.sorte_nivel) or 0);
            				local total = 	nivel + (tonumber(sheet.sorte_outros) or 0);
            				sheet.sorte_total = total;
            				local txt = "D (+0)";
            				if nivel > 43 then
            					txt = "S (+8)";
            				elseif nivel > 29 then
            					txt = "A (+6)";
            				elseif nivel > 17 then
            					txt = "B (+4)";
            				elseif nivel > 7 then
            					txt = "C (+2)";
            				end;
            				sheet.sorte_pericia = txt;
        end, obj);

    obj._e_event11 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					
            					local max = tonumber(sheet.atr_max) or 0;
            					local gastos = tonumber(sheet.sum_nivel) or 0;
            					if max > gastos then
            						self.atr_max.fontColor = "#00FF00";
            					elseif max < gastos then
            						self.atr_max.fontColor = "#FF0000";
            					else
            						self.atr_max.fontColor = "#FFFFFF";
            					end;
        end, obj);

    obj._e_event12 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local sum = 	(tonumber(sheet.agilidade_nivel) or 0) + 
            									(tonumber(sheet.cac_nivel) or 0) + 
            									(tonumber(sheet.manuseio_nivel) or 0) + 
            									(tonumber(sheet.pontaria_nivel) or 0) + 
            									(tonumber(sheet.paranormalidade_nivel) or 0) + 
            									(tonumber(sheet.sorte_nivel) or 0);
            					sheet.sum_nivel = sum;
        end, obj);

    obj._e_event13 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            					local gasto = (tonumber(sheet.carac_p_1) or 0) +
            									(tonumber(sheet.carac_p_2) or 0) +
            									(tonumber(sheet.carac_p_3) or 0) +
            									(tonumber(sheet.carac_p_4) or 0) +
            									(tonumber(sheet.carac_p_5) or 0) +
            									(tonumber(sheet.carac_p_6) or 0);
            					sheet.carac_gasto = gasto;
        end, obj);

    obj._e_event14 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            					local penalidade = (tonumber(sheet.carac_n_1) or 0) +
            									(tonumber(sheet.carac_n_2) or 0) +
            									(tonumber(sheet.carac_n_3) or 0) +
            									(tonumber(sheet.carac_n_4) or 0) +
            									(tonumber(sheet.carac_n_5) or 0) +
            									(tonumber(sheet.carac_n_6) or 0);
            					sheet.carac_penalidade = penalidade;
        end, obj);

    obj._e_event15 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local nivel = (tonumber(sheet.nivel) or 0);
            					local pen = (sheet.carac_penalidade) or 0;
            					local extra = (sheet.carac_extra) or 0;
            
            					sheet.carac_total = nivel - 1 + pen + extra;
        end, obj);

    obj._e_event16 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            					local gasto = tonumber(sheet.carac_gasto) or 0;
            					local total = tonumber(sheet.carac_total) or 0;
            
            					if gasto > total then
            						self.carac_total.fontColor = "#FF0000";
            					elseif gasto==total then
            						self.carac_total.fontColor = "#FFFFFF";
            					else 
            						self.carac_total.fontColor = "#00FF00";
            					end;
        end, obj);

    obj._e_event17 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local vida = 	(tonumber(sheet.vidaBase) or 0) + 
            									(tonumber(sheet.vidaCompensacao) or 0);
            				sheet.vidaAtual = vida;
        end, obj);

    obj._e_event18 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local fadiga = 	(tonumber(sheet.fadigaBase) or 0) + 
            									(tonumber(sheet.fadigaCompensacao) or 0);
            				sheet.fadigaAtual = fadiga;
        end, obj);

    obj._e_event19 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local imersao = 	(tonumber(sheet.imersaoBase) or 0) + 
            									(tonumber(sheet.imersaoCompensacao) or 0);
            				sheet.imersaoAtual = imersao;
        end, obj);

    obj._e_event20 = obj.dataLink17:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local poderFisico1 = 	(tonumber(sheet.poderFisicoBase) or 0) + 
            									(tonumber(sheet.poderFisicoAdicional1) or 0);
            				local poderFisico2 = 	(tonumber(sheet.poderFisicoBase) or 0) + 
            									(tonumber(sheet.poderFisicoAdicional2) or 0);
            				sheet.poderFisicoTotal1 = poderFisico1 .. "";
            				sheet.poderFisicoTotal2 = poderFisico2 .. "";
        end, obj);

    obj._e_event21 = obj.dataLink18:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local poderParanormal1 = 	(tonumber(sheet.poderParanormalBase) or 0) + 
            									(tonumber(sheet.poderParanormalAdicional1) or 0);
            				local poderParanormal2 = 	(tonumber(sheet.poderParanormalBase) or 0) + 
            									(tonumber(sheet.poderParanormalAdicional2) or 0);
            				sheet.poderParanormalTotal1 = poderParanormal1 .. "";
            				sheet.poderParanormalTotal2 = poderParanormal2 .. "";
        end, obj);

    obj._e_event22 = obj.dataLink19:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local poderProjetil1 = 	(tonumber(sheet.poderProjetilBase) or 0) + 
            									(tonumber(sheet.poderProjetilAdicional1) or 0);
            				local poderProjetil2 = 	(tonumber(sheet.poderProjetilBase) or 0) + 
            									(tonumber(sheet.poderProjetilAdicional2) or 0);
            				sheet.poderProjetilTotal1 = poderProjetil1 .. "";
            				sheet.poderProjetilTotal2 = poderProjetil2 .. "";
        end, obj);

    obj._e_event23 = obj.dataLink20:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local regVida = 	(tonumber(sheet.regVidaBase) or 0) + 
            									(tonumber(sheet.regVidaAdicional) or 0);
            
            				regVida = math.floor(regVida / 1);
            
            				sheet.regVidaTotal = regVida .. "%";
        end, obj);

    obj._e_event24 = obj.dataLink21:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local regFadiga = 	(tonumber(sheet.regFadigaBase) or 0) + 
            									(tonumber(sheet.regFadigaAdicional) or 0);
            
            				regFadiga = math.floor(regFadiga / 1);
            
            				sheet.regFadigaTotal = regFadiga .. "%";
        end, obj);

    obj._e_event25 = obj.dataLink22:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local actPadrao = 	(tonumber(sheet.actPadraoBase) or 0) + 
            									(tonumber(sheet.actPadraoAdicional) or 0) + 
            									(tonumber(sheet.equip_arma_act) or 0) + 
            									(tonumber(sheet.equip_arma2_act) or 0) + 
            									(tonumber(sheet.equip_equipamento_act) or 0) + 
            									(tonumber(sheet.equip_vestimenta_act) or 0);
            
            				sheet.actPadraoTotal = actPadrao;
        end, obj);

    obj._e_event26 = obj.dataLink23:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local ptsInstantanea = 	(tonumber(sheet.ptsInstantaneaBase) or 0) + 
            									(tonumber(sheet.ptsInstantaneaAdicional) or 0);
            
            				ptsInstantanea = math.floor(ptsInstantanea / 1);
            
            				sheet.ptsInstantaneaTotal = ptsInstantanea .. "";
        end, obj);

    obj._e_event27 = obj.dataLink24:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local critico = 	(tonumber(sheet.criticoBase) or 0) + 
            									(tonumber(sheet.criticoAdicional) or 0);
            
            				critico = math.floor(critico / 5);
            
            				sheet.criticoTotal = critico .. "";
        end, obj);

    obj._e_event28 = obj.dataLink25:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local amplificacao = 	(tonumber(sheet.amplificacaoBase) or 0) + 
            									(tonumber(sheet.amplificacaoAdicional) or 0);
            
            				amplificacao = math.floor(amplificacao / 1);
            
            				sheet.amplificacaoTotal = amplificacao .. "%";
        end, obj);

    obj._e_event29 = obj.dataLink26:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local negacao = 	(tonumber(sheet.negacaoBase) or 0) + 
            									(tonumber(sheet.negacaoAdicional) or 0);
            
            				negacao = math.floor(negacao / 1);
            
            				sheet.negacaoTotal = negacao .. "";
        end, obj);

    obj._e_event30 = obj.dataLink27:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local fisico = 	(tonumber(sheet.fisicoBase) or 0) + 
            									(tonumber(sheet.fisicoAdicional) or 0);
            
            				fisico = math.floor(fisico / 1);
            
            				sheet.fisicoTotal = fisico .. "";
        end, obj);

    obj._e_event31 = obj.dataLink28:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local paranormal = 	(tonumber(sheet.paranormalBase) or 0) + 
            									(tonumber(sheet.paranormalAdicional) or 0);
            
            				paranormal = math.floor(paranormal / 1);
            
            				sheet.paranormalTotal = paranormal .. "";
        end, obj);

    obj._e_event32 = obj.dataLink29:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local projetil = 	(tonumber(sheet.projetilBase) or 0) + 
            									(tonumber(sheet.projetilAdicional) or 0);
            
            				projetil = math.floor(projetil / 1);
            
            				sheet.projetilTotal = projetil .. "";
        end, obj);

    obj._e_event33 = obj.dataLink30:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local corrosivo = 	(tonumber(sheet.corrosivoBase) or 0) + 
            									(tonumber(sheet.corrosivoAdicional) or 0);
            
            				corrosivo = math.floor(corrosivo / 1);
            
            				sheet.corrosivoTotal = corrosivo .. "";
        end, obj);

    obj._e_event34 = obj.dataLink31:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local impelimento = 	(tonumber(sheet.impelimentoBase) or 0) + 
            									(tonumber(sheet.impelimentoAdicional) or 0);
            
            				impelimento = math.floor(impelimento / 1);
            
            				sheet.impelimentoTotal = impelimento .. "";
        end, obj);

    obj._e_event35 = obj.dataLink32:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local sangramento = 	(tonumber(sheet.sangramentoBase) or 0) + 
            									(tonumber(sheet.sangramentoAdicional) or 0);
            
            				sangramento = math.floor(sangramento / 1);
            
            				sheet.sangramentoTotal = sangramento .. "";
        end, obj);

    obj._e_event36 = obj.dataLink33:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local fragilizacao = 	(tonumber(sheet.fragilizacaoBase) or 0) + 
            									(tonumber(sheet.fragilizacaoAdicional) or 0);
            
            				fragilizacao = math.floor(fragilizacao / 1);
            
            				sheet.fragilizacaoTotal = fragilizacao .. "";
        end, obj);

    obj._e_event37 = obj.dataLink34:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local atordoamento = 	(tonumber(sheet.atordoamentoBase) or 0) + 
            									(tonumber(sheet.atordoamentoAdicional) or 0);
            
            				atordoamento = math.floor(atordoamento / 1);
            
            				sheet.atordoamentoTotal = atordoamento .. "";
        end, obj);

    obj._e_event38 = obj.dataLink35:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local provocacao = 	(tonumber(sheet.provocacaoBase) or 0) + 
            									(tonumber(sheet.provocacaoAdicional) or 0);
            
            				provocacao = math.floor(provocacao / 1);
            
            				sheet.provocacaoTotal = provocacao .. "";
        end, obj);

    obj._e_event39 = obj.dataLink36:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local silenciado = 	(tonumber(sheet.silenciadoBase) or 0) + 
            									(tonumber(sheet.silenciadoAdicional) or 0);
            
            				silenciado = math.floor(silenciado / 1);
            
            				sheet.silenciadoTotal = silenciado .. "";
        end, obj);

    obj._e_event40 = obj.dataLink37:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local envenenamento = 	(tonumber(sheet.envenenamentoBase) or 0) + 
            									(tonumber(sheet.envenenamentoAdicional) or 0);
            
            				envenenamento = math.floor(envenenamento / 1);
            
            				sheet.envenenamentoTotal = envenenamento .. "";
        end, obj);

    obj._e_event41 = obj.dataLink38:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local incendiado = 	(tonumber(sheet.incendiadoBase) or 0) + 
            									(tonumber(sheet.incendiadoAdicional) or 0);
            
            				incendiado = math.floor(incendiado / 1);
            
            				sheet.incendiadoTotal = incendiado .. "";
        end, obj);

    obj._e_event42 = obj.dataLink39:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local cac = (tonumber(sheet.cac_total) or 0); -- constituição
            					local paranormalidade = (tonumber(sheet.paranormalidade_total) or 0); -- reverberação
            					local agilidade = (tonumber(sheet.agilidade_total) or 0);
            					local sorte = (tonumber(sheet.sorte_total) or 0);
            					local destreza = (tonumber(sheet.manuseio_total) or 0);
            					local precisao = (tonumber(sheet.pontaria_total) or 0);
            
            					local agilidadeBase = (tonumber(sheet.agilidade_nivel) or 0);
            
            					-- PODER
            					local aux = agilidade * 2 + cac * 4 + destreza * 3 + sorte * 2;
            					if (tonumber(sheet.cac_nivel) or 0) > 7 then 
            						aux = aux  + precisao * 4;
            					end;
            					sheet.poderFisicoBase = aux;
            
            					aux = destreza * 3 + paranormalidade * 4 + sorte * 2;
            					if (tonumber(sheet.paranormalidade_nivel) or 0) > 7 then 
            						aux = aux  + precisao * 5;
            					end;
            					sheet.poderParanormalBase = aux;
            
            					aux = destreza * 4 + sorte * 3;
            					if (tonumber(sheet.manuseio_nivel) or 0) > 7 then 
            						aux = aux  + precisao * 5;
            					end;
            					sheet.poderProjetilBase = aux;
            
            					-- STATUS DE COMBATE
            
            					sheet.regVidaBase = 10 + math.floor(cac/3);
            					sheet.regFadigaBase = 10 + math.floor(paranormalidade/3);
            
            					if agilidade > 3 then
            						sheet.actPadraoBase = math.floor(agilidade);
            					else
            						sheet.actPadraoBase = 0;
            					end;
            
            					sheet.actPadraoBase = 12;
            					if agilidadeBase > 43 then
            						sheet.actPadraoBase = 4;
            					elseif agilidadeBase > 29 then
            						sheet.actPadraoBase = 6;
            					elseif agilidadeBase > 17 then
            						sheet.actPadraoBase = 8;
            					elseif agilidadeBase > 7 then
            						sheet.actPadraoBase = 10;
            					end;
            
            					sheet.ptsInstantaneaBase = 10 + math.floor(agilidade/3);
            					sheet.criticoBase = 5 + math.floor(sorte/3) * 3;
            					sheet.amplificacaoBase = math.floor(destreza/3)*5;
            					sheet.negacaoBase = math.floor(precisao/3)*5;
            
            					-- REDUTORES
            
            					sheet.fisicoBase = math.floor(cac/3)*10;
            					sheet.paranormalBase = math.floor(paranormalidade/3)*10;
            					sheet.projetilBase = math.floor(sorte/3)*10;
            					sheet.corrosivoBase = math.floor(destreza/3)*10;
            
            					-- RESISTENCIAS
            
            					sheet.impelimentoBase = math.floor(cac/3)*2;
            					sheet.imobilizacaoBase = math.floor(agilidade/3)*2;
            					sheet.sangramentoBase = math.floor(cac/3)*2;
            					sheet.fragilizacaoBase = math.floor(destreza/3)*2;
            					sheet.atordoamentoBase = math.floor(destreza/3)*2;
            					sheet.paralisacaoBase = math.floor(destreza/3)*2;
            					sheet.provocacaoBase = math.floor(paranormalidade/3)*2;
            					sheet.silenciadoBase = math.floor(paranormalidade/3)*2;
            					sheet.envenenamentoBase = math.floor(sorte/3)*2;
            					sheet.incendiadoBase = math.floor(sorte/3)*2;
        end, obj);

    obj._e_event43 = obj.dataLink40:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            					local gasto = tonumber(sheet.habilidadesNivel) or 0;
            					local total = tonumber(sheet.habilidadesDisponivel) or 0;
            
            					if gasto > total then
            						self.habilidadesDisponivel.fontColor = "#FF0000";
            					elseif gasto==total then
            						self.habilidadesDisponivel.fontColor = "#FFFFFF";
            					else 
            						self.habilidadesDisponivel.fontColor = "#00FF00";
            					end;
        end, obj);

    obj._e_event44 = obj.rclHabilidades:addEventListener("onEndEnumeration",
        function (_)
            if sheet== nil then return end;
            					
            					local objetos = NDB.getChildNodes(sheet.listaDeHabilidades);
            					if objetos[1].nivel == nil then
            						objetos[1].nivel = 1;
            					end;
        end, obj);

    obj._e_event45 = obj.dataLink41:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local armazenamento1 = (tonumber(sheet.armazenamento1) or 0);
            					local armazenamento2 = (tonumber(sheet.armazenamento2) or 0);
            					local armazenamento3 = (tonumber(sheet.armazenamento3) or 0);
            					local tamanho = 10 + armazenamento1 + armazenamento2 + armazenamento3;
            					sheet.inventarioTamanho = tamanho;
            					self.rclInventario.minQt = tamanho;
            
            					local objetos = NDB.getChildNodes(sheet.listaDeItens);
            
            					if #objetos > tamanho then
            						local excesso = #objetos - tamanho;
            						showMessage("Você possui " .. excesso .. " itens além do limite.");
            					end;
        end, obj);

    obj._e_event46 = obj.comboBox6:addEventListener("onChange",
        function (_)
            if sheet == nil then return end;
            					local theme = sheet.theme;
            					if theme == "Claro" then
            						theme = "light";
            					else
            						theme = "dark";
            					end;
            
            					local forms = findClass("form");
            
            					for i=1, #forms, 1 do 
            						forms[i].theme = theme;
            					end;
        end, obj);

    obj._e_event47 = obj.dataLink43:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local color = sheet.colorBackground or "#000000";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].color = color;
            					end;
        end, obj);

    obj._e_event48 = obj.dataLink44:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local strokeColor = sheet.colorStroke or "#FFFFFF";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].strokeColor = strokeColor;
            					end;
        end, obj);

    obj._e_event49 = obj.dataLink45:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local fontColor = sheet.colorFont or "#FFFFFF";
            
            					local controls = findAllControls();
            					
            					local edits = filterByClass("edit", controls);
            					for i=1, #edits, 1 do 
            						edits[i].fontColor = fontColor;
            					end;
            
            					local labels = filterByClass("label", controls);
            					for i=1, #labels, 1 do 
            						labels[i].fontColor = fontColor;
            					end;
            
            					local comboBoxs = filterByClass("comboBox", controls);
            					for i=1, #comboBoxs, 1 do 
            						comboBoxs[i].fontColor = fontColor;
            					end;
            
            					local textEditors = filterByClass("textEditor", controls);
            					for i=1, #textEditors, 1 do 
            						textEditors[i].fontColor = fontColor;
            					end;
            
            					local checkBoxs = filterByClass("checkBox", controls);
            					for i=1, #checkBoxs, 1 do 
            						checkBoxs[i].fontColor = fontColor;
            					end;
            
            					local buttons = filterByClass("button", controls);
            					for i=1, #buttons, 1 do 
            						buttons[i].fontColor = fontColor;
            					end;
        end, obj);

    obj._e_event50 = obj.button1:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20The%20Maze/README.md')
        end, obj);

    obj._e_event51 = obj.button2:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20The%20Maze/output/Ficha%20The%20Maze.rpk?raw=true')
        end, obj);

    obj._e_event52 = obj.button3:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event53 = obj.button4:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=130746');
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event53);
        __o_rrpgObjs.removeEventListenerById(self._e_event52);
        __o_rrpgObjs.removeEventListenerById(self._e_event51);
        __o_rrpgObjs.removeEventListenerById(self._e_event50);
        __o_rrpgObjs.removeEventListenerById(self._e_event49);
        __o_rrpgObjs.removeEventListenerById(self._e_event48);
        __o_rrpgObjs.removeEventListenerById(self._e_event47);
        __o_rrpgObjs.removeEventListenerById(self._e_event46);
        __o_rrpgObjs.removeEventListenerById(self._e_event45);
        __o_rrpgObjs.removeEventListenerById(self._e_event44);
        __o_rrpgObjs.removeEventListenerById(self._e_event43);
        __o_rrpgObjs.removeEventListenerById(self._e_event42);
        __o_rrpgObjs.removeEventListenerById(self._e_event41);
        __o_rrpgObjs.removeEventListenerById(self._e_event40);
        __o_rrpgObjs.removeEventListenerById(self._e_event39);
        __o_rrpgObjs.removeEventListenerById(self._e_event38);
        __o_rrpgObjs.removeEventListenerById(self._e_event37);
        __o_rrpgObjs.removeEventListenerById(self._e_event36);
        __o_rrpgObjs.removeEventListenerById(self._e_event35);
        __o_rrpgObjs.removeEventListenerById(self._e_event34);
        __o_rrpgObjs.removeEventListenerById(self._e_event33);
        __o_rrpgObjs.removeEventListenerById(self._e_event32);
        __o_rrpgObjs.removeEventListenerById(self._e_event31);
        __o_rrpgObjs.removeEventListenerById(self._e_event30);
        __o_rrpgObjs.removeEventListenerById(self._e_event29);
        __o_rrpgObjs.removeEventListenerById(self._e_event28);
        __o_rrpgObjs.removeEventListenerById(self._e_event27);
        __o_rrpgObjs.removeEventListenerById(self._e_event26);
        __o_rrpgObjs.removeEventListenerById(self._e_event25);
        __o_rrpgObjs.removeEventListenerById(self._e_event24);
        __o_rrpgObjs.removeEventListenerById(self._e_event23);
        __o_rrpgObjs.removeEventListenerById(self._e_event22);
        __o_rrpgObjs.removeEventListenerById(self._e_event21);
        __o_rrpgObjs.removeEventListenerById(self._e_event20);
        __o_rrpgObjs.removeEventListenerById(self._e_event19);
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.rectangle64 ~= nil then self.rectangle64:destroy(); self.rectangle64 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.rectangle67 ~= nil then self.rectangle67:destroy(); self.rectangle67 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.label192 ~= nil then self.label192:destroy(); self.label192 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.label186 ~= nil then self.label186:destroy(); self.label186 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.atr_max ~= nil then self.atr_max:destroy(); self.atr_max = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.label176 ~= nil then self.label176:destroy(); self.label176 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.rectangle68 ~= nil then self.rectangle68:destroy(); self.rectangle68 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.rectangle80 ~= nil then self.rectangle80:destroy(); self.rectangle80 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.frmTemplateCreditos ~= nil then self.frmTemplateCreditos:destroy(); self.frmTemplateCreditos = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.rectangle88 ~= nil then self.rectangle88:destroy(); self.rectangle88 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.label184 ~= nil then self.label184:destroy(); self.label184 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.rectangle82 ~= nil then self.rectangle82:destroy(); self.rectangle82 = nil; end;
        if self.rectangle77 ~= nil then self.rectangle77:destroy(); self.rectangle77 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.label185 ~= nil then self.label185:destroy(); self.label185 = nil; end;
        if self.label194 ~= nil then self.label194:destroy(); self.label194 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.rectangle76 ~= nil then self.rectangle76:destroy(); self.rectangle76 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.frmBase ~= nil then self.frmBase:destroy(); self.frmBase = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.rectangle66 ~= nil then self.rectangle66:destroy(); self.rectangle66 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.label181 ~= nil then self.label181:destroy(); self.label181 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.label175 ~= nil then self.label175:destroy(); self.label175 = nil; end;
        if self.rectangle78 ~= nil then self.rectangle78:destroy(); self.rectangle78 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.rectangle63 ~= nil then self.rectangle63:destroy(); self.rectangle63 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.rectangle74 ~= nil then self.rectangle74:destroy(); self.rectangle74 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.rectangle91 ~= nil then self.rectangle91:destroy(); self.rectangle91 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label188 ~= nil then self.label188:destroy(); self.label188 = nil; end;
        if self.rectangle85 ~= nil then self.rectangle85:destroy(); self.rectangle85 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.label193 ~= nil then self.label193:destroy(); self.label193 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label177 ~= nil then self.label177:destroy(); self.label177 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.rclHabilidades ~= nil then self.rclHabilidades:destroy(); self.rclHabilidades = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.rectangle75 ~= nil then self.rectangle75:destroy(); self.rectangle75 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.frmInventory ~= nil then self.frmInventory:destroy(); self.frmInventory = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.rectangle83 ~= nil then self.rectangle83:destroy(); self.rectangle83 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.rectangle70 ~= nil then self.rectangle70:destroy(); self.rectangle70 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle87 ~= nil then self.rectangle87:destroy(); self.rectangle87 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label190 ~= nil then self.label190:destroy(); self.label190 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.rectangle89 ~= nil then self.rectangle89:destroy(); self.rectangle89 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.rclInventario ~= nil then self.rclInventario:destroy(); self.rclInventario = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle65 ~= nil then self.rectangle65:destroy(); self.rectangle65 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.rectangle81 ~= nil then self.rectangle81:destroy(); self.rectangle81 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.rectangle90 ~= nil then self.rectangle90:destroy(); self.rectangle90 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.label191 ~= nil then self.label191:destroy(); self.label191 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.rectangle92 ~= nil then self.rectangle92:destroy(); self.rectangle92 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.label182 ~= nil then self.label182:destroy(); self.label182 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.rectangle71 ~= nil then self.rectangle71:destroy(); self.rectangle71 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.habilidadesDisponivel ~= nil then self.habilidadesDisponivel:destroy(); self.habilidadesDisponivel = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.label178 ~= nil then self.label178:destroy(); self.label178 = nil; end;
        if self.rectangle86 ~= nil then self.rectangle86:destroy(); self.rectangle86 = nil; end;
        if self.label179 ~= nil then self.label179:destroy(); self.label179 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.label174 ~= nil then self.label174:destroy(); self.label174 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.carac_total ~= nil then self.carac_total:destroy(); self.carac_total = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.rectangle79 ~= nil then self.rectangle79:destroy(); self.rectangle79 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.frmTemplateDescription ~= nil then self.frmTemplateDescription:destroy(); self.frmTemplateDescription = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.frmTemplateNotes ~= nil then self.frmTemplateNotes:destroy(); self.frmTemplateNotes = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label173 ~= nil then self.label173:destroy(); self.label173 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label189 ~= nil then self.label189:destroy(); self.label189 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.label180 ~= nil then self.label180:destroy(); self.label180 = nil; end;
        if self.label172 ~= nil then self.label172:destroy(); self.label172 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.rectangle69 ~= nil then self.rectangle69:destroy(); self.rectangle69 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.rectangle73 ~= nil then self.rectangle73:destroy(); self.rectangle73 = nil; end;
        if self.label187 ~= nil then self.label187:destroy(); self.label187 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.label183 ~= nil then self.label183:destroy(); self.label183 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.rectangle84 ~= nil then self.rectangle84:destroy(); self.rectangle84 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle72 ~= nil then self.rectangle72:destroy(); self.rectangle72 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmMain()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmMain();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmMain = {
    newEditor = newfrmMain, 
    new = newfrmMain, 
    name = "frmMain", 
    dataType = "Ambesek.Nefertyne.TheMaze", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha The Maze", 
    description=""};

frmMain = _frmMain;
Firecast.registrarForm(_frmMain);
Firecast.registrarDataType(_frmMain);

return _frmMain;
