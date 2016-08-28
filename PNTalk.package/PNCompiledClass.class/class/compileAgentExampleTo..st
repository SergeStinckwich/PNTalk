examples
compileAgentExampleTo: aRepository

| cls |
cls := PNCompiledClass compileClass: '
class MoveToWastePlan is_a PN
    object
        place myAgent()
    method createPlan: anAgent
        place anAgent()
        place return()
        trans initt
            precond anAgent( anAgent )
            postcond myAgent( anAgent ), return( #e )
    method execute
        place start(#e)
        trans getWaste
            cond myAgent( myAgent )
            precond start( #e )
            guard {
myAgent notAtWastePosition}
            action {
wastePos := myAgent getClosestWaste}
            postcond wastePosition( wastePos )
        trans moveToWaste
            cond myAgent( myAgent )
            precond wastePosition( (x,y) )
            guard {
myAgent notAtWastePosition}
            action {
myAgent moveToPosX: x Y: y.}
            postcond wastePosition( (x,y) )
        place wastePosition()
        trans done
            cond myAgent( myAgent )
            precond start( #e )
            guard {
myAgent atWastePosition}
            postcond return( #success )
        place return()
        trans moveComplete
            cond myAgent( myAgent )
            precond wastePosition( wastePos )
            guard {
myAgent atWastePosition}
            postcond return( #success )
'.
aRepository addComponent: cls named: (cls name).

cls := PNCompiledClass compileClass: '
class Agent is_a PN
    object
        place wastePos((1,5), (4,8), (3,2))
        place binPos()
        place notAtBinPosition(#e)
        place carryWaste()
        place myPos((1,1))
        place binCnt(0)
        place notAtWastePos(#e)
        place noPlan(#e)
        trans ExecutePlan
            precond havePlan( p )
            action {
p execute.}
            postcond noPlan( #e )
        place notCarryWaste(#e)
        place havePlan()
        place wasteCnt(3)
        trans CreatePlan
            cond wasteCnt( cnt )
            precond noPlan( #e )
            guard {
cnt > 0. self notCarryingWaste}
            action {
p := CollectWastePlan new.
p createPlan: self.}
            postcond havePlan( p )
        sync notAtWastePosition
            cond notAtWastePos( #e )
        sync notAtBinPosition
            cond notAtBinPosition( #e )
    method getClosestWaste
        place wastePosTmp()
        trans getClosestWaste
            cond counter( x ), wastePosTmp( (minDstc,wx,wy) ), minDstc( minDstc ), wasteCnt( wasteCnt )
            precond doIntOnce( #e )
            guard {
x = wasteCnt}
            postcond closestWaste( (wx, wy) )
        trans countDistance
            cond myPos( (mx,my) ), wasteCnt( wasteCnt ), doIntOnce( #e )
            precond wastePos( (wx,wy) ), minDstc( minDstc ), counter( x )
            guard {
wasteCnt > 0}
            action {
dstc := ( ((mx - wx) * (mx - wx))
             + ((my - wy) * (my - wy)) ) abs sqrt.
y := x + 1.
newMin := dstc min: minDstc. }
            postcond counter( y ), minDstc( newMin ), wastePosTmp( (dstc,wx,wy) )
        place closestWaste()
        place return()
        place counter(0)
        place minDstc(10000)
        trans finish
            cond counter( x )
            precond closestWaste( (wx,wy) )
            guard {
x = 0}
            postcond return( (wx,wy) )
        place doIntOnce(#e)
        trans noWaste
            cond wasteCnt( wasteCnt )
            guard {
wasteCnt = 0}
            postcond return( (#e,#e) )
        trans returnWp
            cond closestWaste( (wwx,wwy) )
            precond wastePosTmp( (dstc,wx,wy) ), counter( x )
            action {
y := x - 1.}
            postcond counter( y ), wastePos( (wx,wy) )
        sync atBinPosition
            cond myPos( (mx,my) ), binPos( (bx,by) )
            guard {
mx = bx. my = by}
    method moveToPosX: posX Y: posY
        trans nonename169
            precond checkWasteStart( #e )
            action {
cw := self getClosestWaste.}
            postcond closestWaste( cw )
        trans nonename165
            cond myPos( mp )
            precond closestWaste( cw )
            guard {
cw notEquals: mp }
            postcond return( #success )
        place posY()
        trans move
            precond myPos( (mx,my) ), posX ( posX ), posY( posY )
            action {
d := (posX - mx) sign.
newX := mx + d.
d := (posY - my) sign.
newY := my + d.
Transcript show: ''actionMove (''; show: newX printString; 
   show: '',''; show: newY printString; show: '')''; cr.}
            postcond myPos( (newX,newY) ), checkWasteStart( #e )
        place closestWaste()
        place checkWasteStart()
        place posX ()
        trans isWastePosition
            cond myPos( mp )
            precond notAtWastePos( #e ), closestWaste( cw )
            guard {
cw = mp}
            postcond return( #success )
        place return()
        sync atWastePosition
            cond wastePos( (wx,wy) ), myPos( (mx,my) )
            guard {
mx = wx. my = wy}
        sync notCarryingWaste
            cond notCarryWaste( #e )
    method pickWaste
        place return()
        trans pickWaste
            cond myPos( (mx,my) )
            precond wastePos( (wx,wy) ), notCarryWaste( #e ), wasteCnt( cnt )
            guard {
mx = wx. my = wy}
            action {
newCnt := cnt - 1.
Transcript show: ''actionPick''; cr.}
            postcond carryWaste( #e ), return( #e ), wasteCnt( newCnt ), notAtWastePos( #e )
'.
aRepository addComponent: cls named: (cls name).

cls := PNCompiledClass compileClass: '
class CollectWastePlan is_a PN
    object
        place myAgent()
    method createPlan: anAgent
        place anAgent()
        place return()
        trans initt
            precond anAgent( anAgent )
            postcond return( #e ), myAgent( anAgent )
    method execute
        trans pickWaste
            cond myAgent( myAgent )
            precond start( #e )
            guard {
myAgent atWastePosition. myAgent notCarryingWaste}
            action {
myAgent pickWaste.}
            postcond return( #success )
        trans moveSucc
            precond result( res )
            guard {
res = #success}
            postcond start( #e )
        place start(#e)
        place return()
        trans createMoveToWastePlan
            cond myAgent( myAgent )
            precond start( #e )
            guard {
myAgent notAtWastePosition}
            action {
p := MoveToWastePlan new.
p createPlan: myAgent.
res := p execute.}
            postcond result( res )
        place result()
        trans fail
            precond result( res )
            guard {
res = #failure}
            postcond return( #failure )
'.
aRepository addComponent: cls named: (cls name).

cls := PNCompiledClass compileClass: '
class Test is_a PN
    object
        place p1(5`(1,5))
        place p2()
        place p3(3)
        trans t1
            precond p3( x ), p1( x`(a,b) )
            postcond p2( #e )
'.
aRepository addComponent: cls named: (cls name).
