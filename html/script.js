
var defaultBoard = '000105000140000670080002400063070010900000003010090520007200080026000035000409000';
/*
class Options{

    fill(val) {
        for (let i = 0; i < 9; i++){
            this[i] = val;
        }
        return this
    }
    get_index(i) {
        return this[i];
    }
    set_index(i, val) {
        this[i] = val;
    }
    set_option(o, val) {
        this.set_index(o-1, val);
    }
    open() {
        let lst = []
        for (let i = 0; i < 9; i++){
            if (!this[i]){
                lst.push(i);
            }
        }
        return lst;
    }
}*/

class Options{

    fill(val) {
        this.data = []
        if (val === false)
            for (let i = 1; i <= 9; i++){
                this.data.push(i);
            }
        return this
    }
    get_index(i) {
        return !this.data.includes(i+1);
    }
    set_index(i, val) {
        this.set_option(i+1, val);
    }
    set_option(o, val) {
        if (val === true){
            let here = this.data.indexOf(o);
            if (here >= 0) {
                this.data.splice(here, 1);
            }
        } else if (val === false) {
            this.data.push(o);
        }
    }
    open() {
        return this.data;
    }
}

var cells = new Array(81);
for (let i = 0; i < 81; i++){
    let cell = {vis: 0, options: new Options().fill(false), pruned: false};
    cells[i] = cell
    /*cells[i] = new Array(11).fill(false, 1); /* cells[10] is already pruned */
}

var rows = new Array(9);
var cols = new Array(9);
var boxes = new Array(9);

function make_groups(){
    var temp = new Int8Array(9);
    for (let i = 0; i < 9; i++) {
        for (let j = 0; j < 9; j++ ){
            temp[j] = i*9 + j;
        }
        rows[i] = Int8Array.from(temp);
        
        for (let j = 0; j < 9; j++ ){
            temp[j] = i + j*9;
        }
        cols[i] = Int8Array.from(temp);
    }
    
    boxes[0] = Int8Array.of(0,1,2,9,10,11,18,19,20);
    boxes[1] = Int8Array.of(3,4,5,12,13,14,21,22,23);
    boxes[2] = Int8Array.of(6,7,8,15,16,17,24,25,26);
    boxes[3] = Int8Array.of(27,28,29,36,37,38,45,46,47);
    boxes[4] = Int8Array.of(30,31,32,39,40,41,48,49,50);
    boxes[5] = Int8Array.of(33,34,35,42,43,44,51,52,53);
    boxes[6] = Int8Array.of(54,55,56,63,64,65,72,73,74);
    boxes[7] = Int8Array.of(57,58,59,66,67,68,75,76,77);
    boxes[8] = Int8Array.of(60,61,62,69,70,71,78,79,80);
}
make_groups();

function change81(input){
    /* Accept input of 81 char for board */
    var in_board = Array.from(input).map(Number);
    for (let i = 0; i < 81; i++) {
        if (typeof in_board[i] == 'number' && in_board[i] > 0){
            cells[i].vis = parseInt(in_board[i]);
        }   
        
    }
}

function make_notes_list(cell_obj) {
    var notes = document.createElement("div");
    notes.classList.add("notes_list");
    cell_obj.options.open().forEach(option => {
        note = document.createElement("span");
        note.classList.add("note");
        note.innerHTML = option;
        notes.appendChild(note);
    })
    return notes;
}

function printtable(){
    /* print cells to the board*/
    let board = document.getElementById("game_grid");
    let board_cells = board.querySelectorAll(".cell");
    for (let i = 0; i < 81; i++) {
        if (cells[i].vis != 0){
            board_cells[i].innerHTML = cells[i].vis;
        } else {
            board_cells[i].replaceChildren(make_notes_list(cells[i]));
        }
    }
}

function removeFrom(number, group) {
    /* TODO implement accept group reference */
    group.forEach(cell => {
        cells[cell].options.set_option(number, true);
    });
}

function arrayEquals(a, b) {
    // Allows Int8Array as true
    return ((ArrayBuffer.isView(a) &&
        ArrayBuffer.isView(b)) ||
        (Array.isArray(a) &&
        Array.isArray(b))) &&
        a.length === b.length &&
        a.every((val, index) => val === b[index]);
}

function GetRow(num){
    /* TODO implement return reference */
    return rows[parseInt(num / 9)];
}
function GetCol(num){
    /* TODO implement return reference */
    return cols[num % 9];
}
function GetBox(num){
    /* TODO implement return reference */
    return boxes.find(box => box.find(el => el == num) !== undefined);
}

function sharedGroup(first, second) {
    var in_common = [];
    if (arrayEquals(GetRow(first), GetRow(second))) {
        in_common.push(GetRow(first));
    }else if (arrayEquals(GetCol(first), GetCol(second))) {
        in_common.push(GetCol(first));
    }
    if (arrayEquals(GetBox(first), GetBox(second))) {
        in_common.push(GetBox(first));
    }
    return in_common;
}

function prune_options(){
    cells.forEach((cell, i) => {
        modify = cell.vis;
        if (modify > 0 && cell.pruned == false){
            removeFrom(modify, GetRow(i));
            removeFrom(modify, GetCol(i));
            removeFrom(modify, GetBox(i));
            
            /*true means blocked*/
            cell.options.fill(true);
            cell.options.set_option(modify, false);
            cell.pruned = true;
        }

    });
}

/*                          \
|                           |
|       Strategies          |
|                           |
\                          */

function hiddenSingles() {
    let progress = [];
    rows.concat(cols, boxes).forEach(group => {
        for (let opt = 0; opt < 9; opt++) {
            let open_places = group.filter(num => 
                cells[num].options.get_index(opt) == false
            );
            if (open_places.length == 1){
                set = open_places[0];
                if ( cells[set].vis != (opt + 1) ){
                    progress.push({"who": 'HS', "where": set, "what": opt + 1});
                }
            }
        }
    });

    return progress;
}

function nakedSingles() {
    let progress = [];
    cells.forEach((cell, index) => {
        if (cell.vis == 0) {
            let openOptions = cell.options.open();
            if (openOptions.length == 1) {
                progress.push({"who":'NS', "where":index, "what":openOptions[0]});
            }
        }
    });

    return progress
}

function nakedPairs() {

    // find pairs
    var pairs_possible = {};
    cells.forEach((cell, index) => {
        let openOptions = cell.options.open();
        if (openOptions.length == 2) {
            pairs_possible[index] = openOptions;
        }
    });

    progress = []
    // see if pairs share a group
    for (const key1 in pairs_possible) {
        for (const key2 in pairs_possible) {
            if (key1 < key2 && arrayEquals(pairs_possible[key1], pairs_possible[key2])) {
                let hold = sharedGroup(key1, key2);
                if (hold.length > 0) {
                    hold.forEach(group => {
                        /* Technically unnecessary check if this is worth pushing
                        Maybe move this to the eventual Do and Log func */
                        opts = pairs_possible[key1];
                        remaining = group.filter(num => 
                            cells[num].options.get_index(opts[0]) == false ||
                            cells[num].options.get_index(opts[1]) == false
                        );
                        if (remaining.length > 2)
                            progress.push({"who":'NP', "where": group, "because":[parseInt(key1), parseInt(key2)]})
                    });
                }
            }
        }
    }

    return progress;

}

function pointingPair() {
    let progress = [];
    boxes.forEach(box => {
        for (let opt = 0; opt < 9; opt++) {
            let open_places = box.filter(num => 
                cells[num].options.get_index(opt) == false
            );
            if (open_places.length == 2){
                // Will always find Box in common, just ignore that
                let hold = sharedGroup(open_places[0], open_places[1]);
                if (hold.length > 1) {
                    group = hold[0];
                    /* Technically unnecessary check if this is worth pushing
                    Maybe move this to the eventual Do and Log func */
                    remaining = group.filter(num => 
                        cells[num].options.get_index(opt) == false
                    );
                    if (remaining.length > 2)
                        progress.push({"who": 'PP', "where" : group, "what": opt + 1, "because": [open_places[0], open_places[1]]})
                }
            }
        }
    });
    return progress;
}

function follow_strat(strat) {
    let try_lst = strat.call();
    try_lst.forEach(task => {
        switch (task.who) {
            case 'HS':
                cells[task.where].vis = task.what;
                break;
            case 'NS':
                cells[task.where].vis = task.what;
                break;
            case 'NP':
                // Example: {"who":'NP', "where": group, "because":[key1, key2]}
                let openOptions = cells[task.because[0]].options.open();
                openOptions.forEach(option =>{
                    task.where.forEach(cell => {
                        if (! task.because.includes(cell)) {
                            cells[cell].options.set_option(option, true);
                        }
                    });
                })
                break;
            case 'PP':
                // Example: {"who": 'PP', "where": group, "what": opt + 1, "because": [place1, place2]}
                task.where.forEach(cell => {
                    if (! task.because.includes(cell)) {
                        cells[cell].options.set_option(task.what, true);
                    }
                })
                break;
        } 
    });
    return try_lst;
}

function working () {
    
}

change81(defaultBoard);
prune_options();
printtable();
