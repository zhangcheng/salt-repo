rs.initiate({
    _id : "{{replSet}}",
    members : [
        { _id : 0, host : "{{repSetMember1}}" },
        { _id : 1, host : "{{repSetMember2}}" },
        { _id : 2, host : "{{repSetMember3}}" },
    ]
});
